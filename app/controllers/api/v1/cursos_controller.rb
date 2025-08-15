module Api
  module V1
    class CursosController < ApplicationController
      before_action :set_curso, only: [:show, :update, :destroy]

      def index
        @cursos = Curso.all
        render json: @cursos
      end

      def show
        render json: @curso
      end

      def create
        @curso = Curso.new(curso_params)
        if @curso.save
          render json: @curso, status: :created
        else
          render json: { errors: @curso.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @curso.update(curso_params)
          render json: @curso
        else
          render json: { errors: @curso.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @curso.destroy
        head :no_content
      end

      private

      def set_curso
        @curso = Curso.find(params[:id])
      end

      def curso_params
        params.require(:curso).permit(:nome, :codigo, :descricao)
      end
    end
  end
end
