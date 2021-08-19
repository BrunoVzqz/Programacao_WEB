class CreateAgendamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :agendamentos do |t|
      t.date :data
      t.references :profissional_da_saude, null: false, foreign_key: true
      t.references :paciente, null: false, foreign_key: true
      t.string :situacao

      t.timestamps
    end
  end
end
