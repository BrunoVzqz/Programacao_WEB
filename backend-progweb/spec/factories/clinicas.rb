# encoding: UTF-8

FactoryBot.define do
  factory :clinica do
    nome { Faker::Company.name}
    endereco { Faker::Address.full_address }
    sequence(:telefone) { |n| ["+55 (11) 98888-8888",  "9999-9991", 
                              "9999-9992", "9999-9993", 
                              "9999-9994","9999-9995",
                              "9999-9996", "9999-9997", 
                              "9999-9998", "9999-9999",
                              "21 98888-8888", "5511988888888"][n%12] }
  end
end