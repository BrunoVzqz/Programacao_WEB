class AddExametoAgendamentos < ActiveRecord::Migration[6.1]
  def change
    add_reference :agendamentos, :exame, index: true
  end
end
