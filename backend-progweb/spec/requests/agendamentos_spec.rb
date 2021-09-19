require 'rails_helper'

RSpec.describe "Agendamentos", type: :request do

  let(:admin) { create(:usuario) }
  let(:usuario) { admin}
  let(:profissional) { create(:profissional_da_saude) }
  let(:paciente) { create(:paciente) }
  let!(:agendamentos) { create_list(:agendamento, 3) }
  let(:agendamento) { agendamentos.first }

  describe 'GET agendamentos' do
    context 'admin' do
      before { get "/agendamentos", headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'retorna os agendamentos' do
        expect(JSON.parse(response.body).length).to eq(3)
      end
    end

    context 'profissional da saude' do
      let(:usuario) { profissional.usuario }
      let!(:agendamento) { create(:agendamento, profissional_da_saude_id: profissional.id) }
      before { get "/agendamentos", headers: valid_headers }
      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'retorna os agendamentos do profissional' do
        expect(JSON.parse(response.body).length).to eq(1)
      end
    end
    context 'profissional da saude' do
      let(:usuario) { paciente.usuario }
      let!(:agendamento) { create(:agendamento, paciente_id: paciente.id) }
      before { get "/agendamentos", headers: valid_headers }
      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'retorna os agendamentos do paciente' do
        expect(JSON.parse(response.body).length).to eq(1)
      end
    end
  end

  describe 'GET /agendamentos/id' do
    context 'requisição válida' do
      before { get "/agendamentos/#{agendamento.id}", headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'requisição inválida' do
      context 'agendamento não existe' do
        before { get "/agendamentos/-1", headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Agendamento with 'id'=-1")
        end
      end
    end
  end

  describe 'POST /agendamentos' do
    context 'requisição válida' do
      let(:valid_attributes) {
        ActiveSupport::HashWithIndifferentAccess.new(build(:agendamento, 
                                                    profissional_da_saude: profissional,
                                                    paciente: paciente).attributes).to_json
      }

      before { post "/agendamentos", params: valid_attributes, headers: valid_headers }

      it 'tem resposta http 201' do
        expect(response).to have_http_status(201)
      end

      it 'cria o agendamento' do
        expect(Agendamento.all.length).to eq(4)
      end

      it 'o agendamento é ligado a um profissional da saúde e um paciente' do
        expect(profissional.agendamentos.length).to eq(1)
        expect(paciente.agendamentos.length).to eq(1)
      end
    end
  end
  context 'requisição inválida' do
    before { post "/agendamentos", params: {}, headers: valid_headers }

    it 'tem resposta http 422' do
      expect(response).to have_http_status(422)
    end

    it 'Mostra mensagem de erro' do
      expect(JSON.parse(response.body))
      .to match("profissional_da_saude"=>["é obrigatório(a)", "não pode ficar em branco"], 
                "paciente"=>["é obrigatório(a)", "não pode ficar em branco"], 
                "exame"=>["é obrigatório(a)", "não pode ficar em branco"],
                "data"=>["não pode ficar em branco"])
    end
  end

  describe "PUT /agendamentos/id" do
    let(:valid_attributes) {
      ActiveSupport::HashWithIndifferentAccess.new(build(:agendamento, 
                                                  profissional_da_saude: profissional,
                                                  paciente: paciente).attributes)
    }
    context 'requisição válida' do
      before { put "/agendamentos/#{agendamento.id}", params: valid_attributes.to_json, headers: valid_headers }

      it 'tem resposta http 200' do
        expect(response).to have_http_status(200)
      end

      it 'modifica o agendamento' do
        expect(agendamento.reload)
        .to have_attributes(data: valid_attributes[:data],
                            situacao: valid_attributes[:situacao])
      end

    end

    context 'requisição inválida' do
      context 'agendamento não existe' do
        before { put "/agendamentos/-1", params: valid_attributes.to_json, headers: valid_headers }
        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Agendamento with 'id'=-1")
        end
      end
    end
  end

  describe 'DELETE agendamentos/id' do
    context 'requisição válida' do
      before { delete "/agendamentos/#{agendamento.id}", headers: valid_headers }

      it 'tem resposta http 204' do
        expect(response).to have_http_status(204)
      end
      it 'remove o agendamento' do
        expect(Agendamento.all.length).to eq(2)
      end
    end
    context 'requisição inválida' do
      context 'agendamento não existe' do
        before { delete "/agendamentos/-1", params: {}, headers: valid_headers }

        it 'tem resposta http 404' do
          expect(response).to have_http_status(404)
        end

        it 'Mostra mensagem de erro' do
          expect(JSON.parse(response.body)["message"]).to match("Couldn't find Agendamento with 'id'=-1")
        end
      end
    end
  end
end
