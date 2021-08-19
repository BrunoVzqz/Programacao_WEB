# encoding UTF-8

FactoryBot.define do
  factory :agendamento do
    paciente { create(:paciente) }
    profissional_da_saude { create(:profissional_da_saude) }
    data { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    exame { create(:exame) }
    situacao {"Aberto"}
  end
end