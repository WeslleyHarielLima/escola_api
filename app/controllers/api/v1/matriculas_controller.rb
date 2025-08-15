module Api
  module V1
    class MatriculasController < ApplicationController
      before_action :set_matricula, only: [:show, :update, :destroy]

      def index
        @matriculas = Matricula.all
        render json: @matriculas
      end

      def show
        render json: @matricula
      end

      def create
        @matricula = Matricula.new(matricula_params)
        if @matricula.save
          render json: @matricula, status: :created
        else
          render json: { errors: @matricula.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @matricula.update(matricula_params)
          render json: @matricula
        else
          render json: { errors: @matricula.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @matricula.destroy
        head :no_content
      end

      private

      def set_matricula
        @matricula = Matricula.find(params[:id])
      end

      def matricula_params
        params.require(:matricula).permit(:aluno_id, :curso_id, :data_matricula, :status)
      end
    end
  end
end
