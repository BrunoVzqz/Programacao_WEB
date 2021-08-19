# encoding UTF-8

FactoryBot.define do
  factory :exame do
    nome { Faker::Sports::Basketball.team }
    descricao { Faker::Quote.yoda}
  end
end