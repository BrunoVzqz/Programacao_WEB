class CreateProfissionalDaSaudes < ActiveRecord::Migration[6.1]
  def change
    create_table :profissional_da_saudes do |t|
      t.references :clinica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
