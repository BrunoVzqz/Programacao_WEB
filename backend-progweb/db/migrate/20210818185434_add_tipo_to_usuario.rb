class AddTipoToUsuario < ActiveRecord::Migration[6.1]
  def change
    add_column :usuarios, :tipo, :string
  end
end
