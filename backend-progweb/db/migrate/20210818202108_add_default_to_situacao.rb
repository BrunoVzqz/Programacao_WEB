class AddDefaultToSituacao < ActiveRecord::Migration[6.1]
  def self.up
    change_column :agendamentos, :situacao, :string, :default => "Aberto", null: false
  end
end
