require 'rails_helper'

RSpec.describe Agendamento, type: :model do

  subject { build(:agendamento) }
  
  it { should belong_to(:paciente) }
  it { should belong_to(:profissional_da_saude) }
  it { should belong_to(:exame) }

  it { should have_one(:resultado) }

  it { should validate_presence_of(:paciente) }
  it { should validate_presence_of(:profissional_da_saude) }

  it { should validate_inclusion_of(:situacao).in_array(["A Confirmar", "Aberto", "Concluido", "Cancelado"])}

end
