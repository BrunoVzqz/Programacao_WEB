require 'rails_helper'

RSpec.describe "Clinicas", type: :request do
  describe "GET /clinicas" do
    it "works! (now write some real specs)" do
      get clinicas_path
      expect(response).to have_http_status(200)
    end
  end
end
