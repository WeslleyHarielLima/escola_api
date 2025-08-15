class Api::V1::Matricula < ApplicationRecord
  belongs_to :aluno
  belongs_to :curso
end
