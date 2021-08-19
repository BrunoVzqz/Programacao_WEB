class AddProfissionalDaSaudeIdToUsuario < ActiveRecord::Migration[6.1]
  def change
    add_reference :usuarios, :profissional_da_saude, index: true
  end
end
