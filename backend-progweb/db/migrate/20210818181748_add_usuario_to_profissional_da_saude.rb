class AddUsuarioToProfissionalDaSaude < ActiveRecord::Migration[6.1]
  def change
    add_reference :profissional_da_saudes, :usuario, null: false, foreign_key: true
  end
end
