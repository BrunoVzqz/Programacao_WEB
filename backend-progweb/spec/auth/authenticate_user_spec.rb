require 'rails_helper'

RSpec.describe AuthenticateUser do
  # create test user
  let(:usuario) { create(:usuario) }
  # valid request subject
  subject(:valid_auth_obj) { described_class.new(usuario.email, usuario.password) }
  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  # Test suite for AuthenticateUser#call
  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end
    end

    # raise Authentication Error when invalid request
    context 'when invalid credentials' do
      it 'raises an authentication error' do
        expect { invalid_auth_obj.call }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Credenciais inválidas/
          )
      end
    end
  end
end