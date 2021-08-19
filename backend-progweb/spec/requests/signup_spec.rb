require 'rails_helper'

RSpec.describe "Signup", type: :request do
  describe "Post /signup" do
    let(:usuario) { build(:usuario) }
    let(:valid_attributes) do
      attributes_for(:usuario, password_confirmation: usuario.password)
    end
    before { post "/signup", { params: valid_attributes } }

    it "retorna status 200" do
      expect(response).to have_http_status(200)
    end

    it "cria usuario" do
      expect(Usuario.where(email: valid_attributes[:email]).length).to eq(1)
    end

    context "usuario paciente" do

      it "cria paciente" do
        usuario = Usuario.where(email: valid_attributes[:email]).first
        expect(Paciente.find(usuario.paciente_id)).to be_present
      end
    end

    context "usuario profissional da saude" do
      let(:clinica) { create(:clinica) }
      let(:valid_attributes) do
        attributes_for(:usuario, password_confirmation: usuario.password, tipo: "ProfissionalDaSaude", clinica_id: clinica.id)
      end
      before { post "/signup", { params: valid_attributes} } 

      it "cria paciente" do
        usuario = Usuario.where(email: valid_attributes[:email]).first
        expect(ProfissionalDaSaude.find(usuario.profissional_da_saude_id)).to be_present 
      end
    end
  end
end