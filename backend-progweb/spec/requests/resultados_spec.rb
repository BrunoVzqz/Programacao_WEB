require 'rails_helper'

RSpec.describe "Resultados", type: :request do
  let(:admin) { create(:usuario) }
  let(:usuario) { admin }
  let!(:resultados) { create_list(:resultado, 10) }
  let(:resultado) { resultados.first }

  describe 'GET /resultados' do 
    before { get "/resultados", headers: valid_headers }

    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna os resultados' do
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe 'GET /resultados/id' do
    context 'requisição válida' do
      before { get "/resultados/#{resultado.id}", headers: valid_headers }
      
      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'retorna os resultados' do
        expect(JSON.parse(response.body))
        .to include({"id" => resultado.id,  
                   "informacoes" => resultado.informacoes})
      end
    end
    context 'requisição inválida' do
      context 'resultado não existe' do
        before { get "/resultados/-1", headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Resultado with 'id'=-1")
        end
      end
    end
  end

  describe 'POST /resultados' do
    context 'requisição válida' do
      let(:valid_attributes) {
        ActiveSupport::HashWithIndifferentAccess.new(build(:resultado).attributes).to_json
      }

      before { post "/resultados", params: valid_attributes, headers: valid_headers }

      it 'tem resposta http 201' do
        expect(response).to have_http_status(201)
      end

      it 'cria o resultado' do
        expect(Resultado.all.length).to eq(11)
      end
    end
    context 'requisição inválida' do
      before { post "/resultados", params: {}, headers: valid_headers }
  
      it 'tem resposta http 422' do
        expect(response).to have_http_status(422)
      end
  
      it 'Mostra mensagem de erro' do
        expect(JSON.parse(response.body))
        .to match("informacoes"=>["não pode ficar em branco", "é muito curto (mínimo: 3 caracteres)"], 
                  "agendamento" => ["é obrigatório(a)", "não pode ficar em branco"])
      end
    end
  end

  describe 'PUT /resultados/id' do
    let(:valid_attributes) do
      attributes_for(:resultado)
    end
    context 'requisição válida' do
      before { put "/resultados/#{resultado.id}", params: valid_attributes.to_json, headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end

      it 'modifica o resultado' do
        expect(resultado.reload)
        .to have_attributes(informacoes: valid_attributes[:informacoes])
      end
    end

    context 'requisição inválida' do
      context 'resultado não existe' do
        before { put "/resultados/-1", params: valid_attributes.to_json, headers: valid_headers }
        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Resultado with 'id'=-1")
        end
      end
    end
  end

  describe 'DELETE resultados/id' do
    context 'requisição válida' do
      before { delete "/resultados/#{resultado.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove o resultado' do
        expect(Resultado.all.length).to eq(9)
      end
    end
    context 'requisição inválida' do
      context 'resultado não existe' do
        before { delete "/resultados/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Resultado with 'id'=-1")
        end
      end
    end
  end
  
end