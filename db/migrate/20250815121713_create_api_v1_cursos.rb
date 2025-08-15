# db/migrate/20250815121713_create_api_v1_cursos.rb
class CreateApiV1Cursos < ActiveRecord::Migration[7.2]
  def change
    create_table :api_v1_cursos do |t|
      t.string :titulo
      t.text :descricao
      t.string :codigo
      t.integer :duracao_semanas
      t.decimal :preco, precision: 10, scale: 2
      t.integer :maximo_alunos
      t.boolean :ativo, default: true

      t.timestamps
    end

    add_index :api_v1_cursos, :codigo, unique: true
  end
end
