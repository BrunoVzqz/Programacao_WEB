# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_19_180129) do

  create_table "agendamentos", force: :cascade do |t|
    t.date "data"
    t.integer "profissional_da_saude_id", null: false
    t.integer "paciente_id", null: false
    t.string "situacao", default: "Aberto", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paciente_id"], name: "index_agendamentos_on_paciente_id"
    t.index ["profissional_da_saude_id"], name: "index_agendamentos_on_profissional_da_saude_id"
  end

  create_table "clinicas", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exames", force: :cascade do |t|
    t.integer "agendamento_id"
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agendamento_id"], name: "index_exames_on_agendamento_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profissional_da_saudes", force: :cascade do |t|
    t.integer "clinica_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinica_id"], name: "index_profissional_da_saudes_on_clinica_id"
  end

  create_table "resultados", force: :cascade do |t|
    t.string "informacoes"
    t.integer "agendamento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agendamento_id"], name: "index_resultados_on_agendamento_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "sobrenome", null: false
    t.string "email", null: false
    t.date "data_nascimento", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tipo"
    t.integer "profissional_da_saude_id"
    t.integer "paciente_id"
    t.index ["paciente_id"], name: "index_usuarios_on_paciente_id"
    t.index ["profissional_da_saude_id"], name: "index_usuarios_on_profissional_da_saude_id"
  end

  add_foreign_key "agendamentos", "pacientes"
  add_foreign_key "agendamentos", "profissional_da_saudes"
  add_foreign_key "exames", "agendamentos"
  add_foreign_key "profissional_da_saudes", "clinicas"
  add_foreign_key "resultados", "agendamentos"
end
