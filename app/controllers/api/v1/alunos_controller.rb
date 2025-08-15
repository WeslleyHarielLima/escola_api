module Api
  module V1
    class AlunosController < ApplicationController
      before_action :set_aluno, only: [:show, :update, :destroy]

      def index
        @alunos = Aluno.all
        render json: @alunos
      end

      def show
        render json: @aluno
      end

      def create
        @aluno = Aluno.new(aluno_params)
        if @aluno.save
          render json: @aluno, status: :created
        else
          render json: { errors: @aluno.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @aluno.update(aluno_params)
          render json: @aluno
        else
          render json: { errors: @aluno.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @aluno.destroy
        head :no_content
      end

      private

      def set_aluno
        @aluno = Aluno.find(params[:id])
      end

      def aluno_params
        params.require(:aluno).permit(
          :nome, :sobrenome, :email, :telefone, :data_nascimento, :documento, :genero,
          :endereco_rua, :endereco_cidade, :endereco_estado, :endereco_cep, :endereco_pais,
          :nome_responsavel, :telefone_responsavel, :email_responsavel, :observacoes
        )
      end
    end
  end
end
