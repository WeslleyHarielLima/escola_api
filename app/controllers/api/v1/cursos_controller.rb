module Api
  module V1
    class CursosController < ApplicationController
      before_action :set_curso, only: [:show, :update, :destroy]

      # GET /api/v1/cursos
      def index
        @cursos = Curso.all
        render json: @cursos
      end

      # GET /api/v1/cursos/:id
      def show
        render json: @curso
      end

      # POST /api/v1/cursos
      def create
        @curso = Curso.new(curso_params)
        if @curso.save
          render json: @curso, status: :created
        else
          render json: { errors: @curso.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/cursos/:id
      def update
        if @curso.update(curso_params)
          render json: @curso
        else
          render json: { errors: @curso.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cursos/:id
      def destroy
        @curso.destroy
        head :no_content
      end

      private

      # Carrega curso pelo ID
      def set_curso
        @curso = Curso.find(params[:id])
      end

      # Permite todos os campos do schema
      def curso_params
        params.require(:curso).permit(
          :titulo,
          :descricao,
          :codigo,
          :duracao_semanas,
          :preco,
          :maximo_alunos,
          :ativo
        )
      end
    end
  end
end
