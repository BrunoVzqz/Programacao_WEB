require 'rails_helper'

RSpec.describe Clinica, type: :model do

  subject { build(:clinica) }
  
  it { should have_many(:profissionais_da_saude) }

  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:endereco) }
  it { should validate_presence_of(:telefone) }

end
