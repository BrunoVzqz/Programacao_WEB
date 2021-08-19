class CreateExames < ActiveRecord::Migration[6.1]
  def change
    create_table :exames do |t|
      t.references :agendamento, null: false, foreign_key: true
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
