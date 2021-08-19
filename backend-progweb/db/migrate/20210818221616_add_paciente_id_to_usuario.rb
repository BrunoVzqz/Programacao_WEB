class AddPacienteIdToUsuario < ActiveRecord::Migration[6.1]
  def change
    add_reference :usuarios, :paciente, index: true
  end
end
