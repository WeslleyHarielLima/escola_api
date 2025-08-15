class ApplicationController < ActionController::API
  def authenticate_admin!
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base)
      @current_admin = Admin.find(decoded[0]['admin_id'])
    rescue
      render json: { error: 'Não autorizado' }, status: :unauthorized
    end
  end
end
