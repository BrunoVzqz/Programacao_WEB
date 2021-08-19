class RemoveUsuarioId < ActiveRecord::Migration[6.1]
  def change
    remove_column :pacientes, :usuario_id
    remove_column :profissional_da_saudes, :usuario_id
  end
end
