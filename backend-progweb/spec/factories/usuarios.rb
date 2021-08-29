# encoding: UTF-8

FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.first_name }
    sobrenome { Faker::Name.last_name }
    data_nascimento { Faker::Date.birthday(min_age: 18) }
    email { Faker::Internet.email}
    password { 'foobar'}
    tipo { "Administrador" } 
  end
end