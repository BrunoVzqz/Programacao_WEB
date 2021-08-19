require 'rails_helper'

RSpec.describe ProfissionalDaSaude, type: :model do

  #subject { build(:profissional_da_saude) }
  
  it { should have_one(:usuario) }
  it { should have_many(:agendamentos) }

  it { should validate_presence_of(:usuario) }
end
