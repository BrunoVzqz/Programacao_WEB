require 'rails_helper'

RSpec.describe 'Usuario API', type: :request do
  let(:usuario) { build(:usuario) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:usuario, password_confirmation: usuario.password)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new usuario' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end

      context 'usuário paciente' do
        let(:atributos_paciente) do
          attributes_for(:usuario, tipo: "Paciente", password_confirmation: usuario.password)
        end
        before { post '/signup', params: atributos_paciente.to_json, headers: headers }

        it 'creates a new usuario' do
          expect(response).to have_http_status(201)
        end
  
        it 'returns success message' do
          expect(json['message']).to match(/Account created successfully/)
        end
  
        it 'returns an authentication token' do
          expect(json['auth_token']).not_to be_nil
        end

        it 'cria um paciente' do
          expect(Paciente.all.length).to eq(1)
        end
      end

      context 'usuário profissional da saúde' do
        let!(:clinica) { create(:clinica) }
        let(:atributos_paciente) do
          attributes_for(:usuario, 
                         tipo: "ProfissionalDaSaude", 
                         password_confirmation: usuario.password, 
                         clinica_id: clinica.id)
        end
        before { post '/signup', params: atributos_paciente.to_json, headers: headers }

        it 'creates a new usuario' do
          expect(response).to have_http_status(201)
        end
  
        it 'returns success message' do
          expect(json['message']).to match(/Account created successfully/)
        end
  
        it 'returns an authentication token' do
          expect(json['auth_token']).not_to be_nil
        end

        it 'cria um profissional da saude' do
          expect(ProfissionalDaSaude.all.length).to eq(1)
        end
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new usuario' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Validation failed: Password can't be blank, Nome can't be blank, Email can't be blank, Sobrenome can't be blank, Data nascimento can't be blank, Tipo can't be blank, Password digest can't be blank, Tipo is not included in the list, Email is invalid, Email is too short (minimum is 3 characters)")
      end
    end
  end
end