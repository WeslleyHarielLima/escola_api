class CreateApiV1Matriculas < ActiveRecord::Migration[7.2]
  def change
    create_table :api_v1_matriculas do |t|
      t.references :aluno, null: false, foreign_key: { to_table: :api_v1_alunos }
      t.references :curso, null: false, foreign_key: { to_table: :api_v1_cursos }
      t.integer :responsavel_id
      t.date :data_matricula
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
