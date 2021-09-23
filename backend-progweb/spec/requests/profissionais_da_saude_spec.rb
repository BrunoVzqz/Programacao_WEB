require 'rails_helper'

RSpec.describe "ProfissionaisDaSaude", type: :request do

  let(:admin) { create(:usuario) }
  let(:usuario) { admin }
  let!(:profissionais_da_saude) { create_list(:profissional_da_saude, 3) }
  let(:profissional_da_saude) { profissionais_da_saude.first }

  describe 'GET profissionais_da_saude' do
    
    before { get "/profissionais_da_saude", headers: valid_headers }

    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna os profissionais_da_saude' do
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'GET /profissionais_da_saude/id' do
    context 'requisição válida' do
      before { get "/profissionais_da_saude/#{profissional_da_saude.id}", headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'requisição inválida' do
      context 'profissional_da_saude não existe' do
        before { get "/profissionais_da_saude/-1", headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find ProfissionalDaSaude with 'id'=-1")
        end
      end
    end
  end

  describe 'DELETE profissionais_da_saude/id' do
    context 'requisição válida' do
      before { delete "/profissionais_da_saude/#{profissional_da_saude.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove o profissional_da_saude' do
        expect(ProfissionalDaSaude.all.length).to eq(2)
      end
    end
    context 'requisição inválida' do
      context 'profissional_da_saude não existe' do
        before { delete "/profissionais_da_saude/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find ProfissionalDaSaude with 'id'=-1")
        end
      end
    end
  end
end
