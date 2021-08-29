class ClinicaSerializer < ActiveModel::Serializer
  attributes :id, :endereco, :telefone 
  has_many :profissional_da_saudes
end
