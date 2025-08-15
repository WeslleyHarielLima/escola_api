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

ActiveRecord::Schema[7.2].define(version: 2025_08_15_132511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "api_v1_alunos", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.string "email"
    t.string "telefone"
    t.date "data_nascimento"
    t.string "documento"
    t.string "genero"
    t.string "endereco_rua"
    t.string "endereco_cidade"
    t.string "endereco_estado"
    t.string "endereco_cep"
    t.string "endereco_pais"
    t.string "nome_responsavel"
    t.string "telefone_responsavel"
    t.string "email_responsavel"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_api_v1_alunos_on_email", unique: true
  end

  create_table "api_v1_cursos", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.string "codigo"
    t.integer "duracao_semanas"
    t.decimal "preco", precision: 10, scale: 2
    t.integer "maximo_alunos"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo"], name: "index_api_v1_cursos_on_codigo", unique: true
  end

  create_table "api_v1_matriculas", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "curso_id", null: false
    t.integer "responsavel_id"
    t.date "data_matricula"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_api_v1_matriculas_on_aluno_id"
    t.index ["curso_id"], name: "index_api_v1_matriculas_on_curso_id"
  end

  add_foreign_key "api_v1_matriculas", "api_v1_alunos", column: "aluno_id"
  add_foreign_key "api_v1_matriculas", "api_v1_cursos", column: "curso_id"
end
