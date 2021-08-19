class CreatePacientes < ActiveRecord::Migration[6.1]
  def change
    create_table :pacientes do |t|
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
