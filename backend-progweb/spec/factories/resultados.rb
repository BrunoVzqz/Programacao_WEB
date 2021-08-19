# encoding UTF-8

FactoryBot.define do
  factory :resultado do
    informacoes { Faker::Books::Lovecraft.fhtagn}
  end
end