# app/controllers/api/v1/sessions_controller.rb
module Api
  module V1
    class SessionsController < ApplicationController
      # Para APIs JSON, não precisa de CSRF
      # POST /api/v1/login
      def create
        # Extrai corretamente os params enviados pelo frontend
        email    = params.dig(:admin, :email)
        password = params.dig(:admin, :password)

        admin = Admin.find_by(email: email)

        if admin&.valid_password?(password)
          # Gera JWT válido por 24 horas
          token = JWT.encode(
            { admin_id: admin.id, exp: 24.hours.from_now.to_i },
            Rails.application.secret_key_base,
            'HS256'
          )

          render json: { token: token, admin: { id: admin.id, email: admin.email } }, status: :ok
        else
          render json: { error: 'Email ou senha inválidos' }, status: :unauthorized
        end
      rescue => e
        render json: { error: "Erro interno: #{e.message}" }, status: :internal_server_error
      end
    end
  end
end
