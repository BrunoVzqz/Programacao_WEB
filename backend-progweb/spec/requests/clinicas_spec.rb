require 'rails_helper'

RSpec.describe "Clinicas", type: :request do
  let(:usuario) { create(:usuario) }
  let(:headers) { valid_headers }
  let(:headers_invalidos) { invalid_headers }
  let!(:clinicas) { create_list(:clinica, 10) }
  let(:clinica) { clinicas.first }

  describe 'GET clinicas' do
    before { get '/clinicas', headers: valid_headers }
    
    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna as clinicas' do
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe 'GET clinicas/id' do
    before { get "/clinicas/#{clinica.id}", headers: valid_headers }
    
    it 'tem resposta http 200' do
      expect(response).to have_http_status(200)
    end

    it 'retorna as clinicas' do
      expect(JSON.parse(response.body))
      .to match({"id" => clinica.id, 
                 "endereco" => clinica.endereco, 
                 "telefone" => clinica.telefone, 
                 "nome" => clinica.nome,
                 "profissionais_da_saude" => [] })
    end
  end

  describe 'POST clinicas' do
    context 'requisição válida' do
      let(:valid_attributes) do
        attributes_for(:clinica)
      end
      before { post "/clinicas", params: valid_attributes.to_json, headers: valid_headers }
      
      it 'tem resposta http 201' do
        expect(response).to have_http_status(201)
      end

      it 'cria a clínica' do
        expect(Clinica.all.length).to eq(11)
      end
    end

    context 'requisição inválida' do
      context 'atributos inválidos' do
        before { post "/clinicas", params: {}, headers: valid_headers }

        it 'tem resposta http 422' do
          expect(response).to have_http_status(422)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body))
          .to match("endereco"=>["não pode ficar em branco"], 
                    "nome"=>["não pode ficar em branco"], 
                    "telefone"=>["não pode ficar em branco", "Telefone inválido"])
        end
      end
      context 'headers inválidos' do
        let(:usuario) { create(:usuario, tipo: "Paciente") }
        before { post "/clinicas", params: {}, headers: valid_headers }

        it 'tem respostas 403' do
          expect(response).to have_http_status(403)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["error"]).to match("Você não tem permissão para realizar essa ação")
        end
      end
    end
  end

  describe 'PUT clinicas/id' do
    context 'requisição válida' do
      let(:valid_attributes) do
        attributes_for(:clinica)
      end
      before { put "/clinicas/#{clinica.id}", params: valid_attributes.to_json, headers: valid_headers }
      
      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end

      it 'modifica a clinica' do
        expect(clinica.reload)
        .to have_attributes(nome: valid_attributes[:nome],
                            endereco: valid_attributes[:endereco],
                            telefone: valid_attributes[:telefone])
      end
    end

    context 'requisição inválida' do
      context 'clinica não existe' do
        before { put "/clinicas/-1", params: {}, headers: headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Clinica with 'id'=-1")
        end
      end
      context 'headers inválidos' do
        let(:usuario) { create(:usuario, tipo: "Paciente") }
        before { put "/clinicas/#{clinica.id}", params: {}, headers: valid_headers }

        it 'tem respostas 403' do
          expect(response).to have_http_status(403)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["error"]).to match("Você não tem permissão para realizar essa ação")
        end
      end
    end
  end

  describe 'DELETE clinicas/id' do
    context 'requisição válida' do
      before { delete "/clinicas/#{clinica.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove a clinica' do
        expect(Clinica.all.length).to eq(9)
      end
    end
    context 'requisição inválida' do
      context 'clinica não existe' do
        before { put "/clinicas/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Clinica with 'id'=-1")
        end
      end

      context 'headers inválidos' do
        let(:usuario) { create(:usuario, tipo: "Paciente") }
        before { put "/clinicas/#{clinica.id}", params: {}, headers: valid_headers }

        it 'tem respostas 403' do
          expect(response).to have_http_status(403)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["error"]).to match("Você não tem permissão para realizar essa ação")
        end
      end
    end
  end
end
