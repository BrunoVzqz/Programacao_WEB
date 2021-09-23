require 'rails_helper'

RSpec.describe "Pacientes", type: :request do

  let(:admin) { create(:usuario) }
  let(:usuario) { admin }
  let!(:pacientes) { create_list(:paciente, 3) }
  let(:paciente) { pacientes.first }

  describe 'GET pacientes' do
    
    before { get "/pacientes", headers: valid_headers }

    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna os pacientes' do
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'GET /pacientes/id' do
    context 'requisição válida' do
      before { get "/pacientes/#{paciente.id}", headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'requisição inválida' do
      context 'paciente não existe' do
        before { get "/pacientes/-1", headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Paciente with 'id'=-1")
        end
      end
    end
  end

  describe 'DELETE pacientes/id' do
    context 'requisição válida' do
      before { delete "/pacientes/#{paciente.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove o paciente' do
        expect(Paciente.all.length).to eq(2)
      end
    end
    context 'requisição inválida' do
      context 'paciente não existe' do
        before { delete "/pacientes/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Paciente with 'id'=-1")
        end
      end
    end
  end
end
