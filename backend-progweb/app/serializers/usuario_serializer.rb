class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nome, :sobrenome, :email, :data_nascimento, :tipo

end
