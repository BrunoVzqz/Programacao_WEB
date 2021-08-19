# encoding: UTF-8

FactoryBot.define do
  factory :clinica do
    nome { Faker::Company.name}
    endereco { Faker::Address.full_address }
    sequence(:telefone) { |n| ["+55 (11) 98888-8888",  "9999-9999", "21 98888-8888", "5511988888888"][n%4] }
  end
end