require 'rails_helper'

RSpec.describe Usuario, type: :model do
  subject { build(:usuario) }

  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:sobrenome) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should validate_length_of(:email).is_at_most(256) }
  it { should validate_presence_of(:data_nascimento) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:tipo) }
  it { should validate_inclusion_of(:tipo).in_array(["ProfissionalDaSaude", "Paciente", "Administrador"])}
end
