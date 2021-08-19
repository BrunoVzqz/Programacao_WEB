require 'rails_helper'

RSpec.describe "Pacientes", type: :request do
  describe "GET /pacientes" do
    it "works! (now write some real specs)" do
      get pacientes_path
      expect(response).to have_http_status(200)
    end
  end
end
