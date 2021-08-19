require 'rails_helper'

RSpec.describe Exame, type: :model do
  subject { build(:exame) }

  it { should belong_to(:agendamento) }
  
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:descricao) }

end
