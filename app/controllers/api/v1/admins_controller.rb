module Api
  module V1
    class AdminsController < ApplicationController
      # Antes de criar, não precisa autenticar (pode ser ajustado depois)
      # Se quiser proteção, use authenticate_admin! em outras actions
      # POST /api/v1/admins
      def create
        admin = Admin.new(admin_params)

        if admin.save
          render json: { admin: { id: admin.id, email: admin.email } }, status: :created
        else
          render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def admin_params
        params.require(:admin).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
