Rails.application.routes.draw do
  # Rotas Devise para admins via web (opcional)
  devise_for :admins

  # API JSON para Next.js
  namespace :api do
    namespace :v1 do
      # Rota de login JWT
      post 'login', to: 'sessions#create'
      resources :admins, only: [:create]  # ← nova rota POST /api/v1/admins
      # Rotas protegidas da API
      resources :alunos, only: [:index, :show, :create, :update, :destroy]
      resources :cursos, only: [:index, :show, :create, :update, :destroy]
      resources :matriculas, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
