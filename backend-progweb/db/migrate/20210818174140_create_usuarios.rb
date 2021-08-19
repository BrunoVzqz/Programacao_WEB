class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :sobrenome, null: false
      t.string :email, null: false
      t.date :data_nascimento, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
