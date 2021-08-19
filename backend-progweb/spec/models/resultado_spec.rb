require 'rails_helper'

RSpec.describe Resultado, type: :model do
  
  subject { build(:resultado) }

  it { should belong_to(:agendamento) }

  it { should validate_presence_of(:agendamento) }
  it { should validate_presence_of(:informacoes) }

end
