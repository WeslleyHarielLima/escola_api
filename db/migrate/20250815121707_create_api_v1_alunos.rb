# db/migrate/20250815121707_create_api_v1_alunos.rb
class CreateApiV1Alunos < ActiveRecord::Migration[7.2]
  def change
    create_table :api_v1_alunos do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :telefone
      t.date :data_nascimento
      t.string :documento
      t.string :genero
      t.string :endereco_rua
      t.string :endereco_cidade
      t.string :endereco_estado
      t.string :endereco_cep
      t.string :endereco_pais
      t.string :nome_responsavel
      t.string :telefone_responsavel
      t.string :email_responsavel
      t.text :observacoes

      t.timestamps
    end

    add_index :api_v1_alunos, :email, unique: true
  end
end
