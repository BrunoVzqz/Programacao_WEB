require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  # create test usuario
  let!(:usuario) { create(:usuario) }
   # set headers for authorization
  let(:headers) { { 'Authorization' => token_generator(usuario.attributes) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe "#authorize_request" do
    context "when auth token is passed" do
      before { allow(request).to receive(:headers).and_return(headers) }

      # private method authorize_request returns current usuario
      it "sets the current usuario" do
        expect(subject.instance_eval { authorize_request }).to eq(usuario)
      end
    end

    context "when auth token is not passed" do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it "raises MissingToken error" do
        expect { subject.instance_eval { authorize_request } }.
          to raise_error(ExceptionHandler::MissingToken, /Token não encontrado/)
      end
    end
  end
end