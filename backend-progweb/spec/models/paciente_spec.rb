require 'rails_helper'

RSpec.describe Paciente, type: :model do

  subject { build(:paciente) }

  it { should have_one(:usuario) }
  it { should have_many(:agendamentos) }

  it { should validate_presence_of(:usuario) }
end
