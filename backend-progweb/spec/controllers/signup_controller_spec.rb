require 'rails_helper'

RSpec.describe SignupController, type: :controller do

  describe "Post" do
    let(:user_attributes) { 
      ActiveSupport::HashWithIndifferentAccess.new(build(:usuario, tipo: "Paciente")) 
    }
    before { post "/signup", { params: user_attributes } }
    it "returns http success" do
      p response
    end
  end

end
