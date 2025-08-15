Rails.application.routes.draw do
  # Devise login futuramente
  # devise_for :users, skip: [:registrations, :passwords, :confirmations]

  namespace :api do
    namespace :v1 do
      resources :alunos, only: [:index, :show, :create, :update, :destroy]
      resources :cursos, only: [:index, :show, :create, :update, :destroy]
      resources :matriculas, only: [:index, :show, :create, :update, :destroy]
    end
  end
end

