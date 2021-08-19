class CreateResultados < ActiveRecord::Migration[6.1]
  def change
    create_table :resultados do |t|
      t.string :informacoes
      t.references :agendamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
