class ClinicaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :endereco, :telefone 
  has_many :profissionais_da_saude
end
