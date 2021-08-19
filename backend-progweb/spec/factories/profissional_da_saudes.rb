# encoding UTF-8

FactoryBot.define do
  factory :profissional_da_saude do
    usuario { create(:usuario, tipo: "ProfissionalDaSaude") }
    clinica { create(:clinica) }
  end
end