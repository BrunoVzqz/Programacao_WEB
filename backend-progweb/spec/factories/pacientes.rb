# encoding UTF-8

FactoryBot.define do
  factory :paciente do
    usuario { create(:usuario, tipo: "Paciente") }
  end
end