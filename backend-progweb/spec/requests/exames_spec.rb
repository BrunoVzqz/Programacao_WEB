require 'rails_helper'

RSpec.describe "Exames", type: :request do
  let(:admin) { create(:usuario) }
  let(:usuario) { admin }
  let!(:exames) { create_list(:exame, 10) }
  let(:exame) { exames.first }

  describe 'GET /exames' do 
    before { get "/exames", headers: valid_headers }

    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna os exames' do
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe 'GET /exames/id' do
    context 'requisição válida' do
      before { get "/exames/#{exame.id}", headers: valid_headers }
      
      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'retorna os exames' do
        expect(JSON.parse(response.body))
        .to match({"id" => exame.id,  
                   "nome" => exame.nome,
                   "descricao" => exame.descricao})
      end
    end
    context 'requisição inválida' do
      context 'exame não existe' do
        before { get "/exames/-1", headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Exame with 'id'=-1")
        end
      end
    end
  end

  describe 'POST /exames' do
    context 'requisição válida' do
      let(:valid_attributes) {
        ActiveSupport::HashWithIndifferentAccess.new(build(:exame).attributes).to_json
      }

      before { post "/exames", params: valid_attributes, headers: valid_headers }

      it 'tem resposta http 201' do
        expect(response).to have_http_status(201)
      end

      it 'cria o exame' do
        expect(Exame.all.length).to eq(11)
      end
    end
    context 'requisição inválida' do
      before { post "/exames", params: {}, headers: valid_headers }
  
      it 'tem resposta http 422' do
        expect(response).to have_http_status(422)
      end
  
      it 'Mostra mensagem de erro' do
        expect(JSON.parse(response.body))
        .to match("descricao"=>["não pode ficar em branco"], 
                  "nome"=>["não pode ficar em branco"])
      end
    end
  end

  describe 'PUT /exames/id' do
    let(:valid_attributes) do
      attributes_for(:exame)
    end
    context 'requisição válida' do
      before { put "/exames/#{exame.id}", params: valid_attributes.to_json, headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end

      it 'modifica o exame' do
        expect(exame.reload)
        .to have_attributes(nome: valid_attributes[:nome],
                            descricao: valid_attributes[:descricao])
      end
    end

    context 'requisição inválida' do
      context 'exame não existe' do
        before { put "/exames/-1", params: valid_attributes.to_json, headers: valid_headers }
        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Exame with 'id'=-1")
        end
      end
    end
  end

  describe 'DELETE exames/id' do
    context 'requisição válida' do
      before { delete "/exames/#{exame.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove o exame' do
        expect(Exame.all.length).to eq(9)
      end
    end
    context 'requisição inválida' do
      context 'exame não existe' do
        before { delete "/exames/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Exame with 'id'=-1")
        end
      end
    end
  end
end