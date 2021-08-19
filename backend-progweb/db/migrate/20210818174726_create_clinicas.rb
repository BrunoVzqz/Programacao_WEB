class CreateClinicas < ActiveRecord::Migration[6.1]
  def change
    create_table :clinicas do |t|
      t.string :nome
      t.string :endereco
      t.string :telefone

      t.timestamps
    end
  end
end
