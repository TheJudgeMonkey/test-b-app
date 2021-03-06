Rails.application.routes.draw do
  get 'private/test'
  get '/current_user', to: 'current_user#index'
  resources :users, only: [:index, :show, :update, :destroy, :create] do 
    resources :items, only: [:index, :show, :update, :destroy, :create]
  end
  resources :posts, only: [:index, :show, :update, :destroy, :create] do 
    resources :items, only: [:index, :show, :update, :destroy, :create]
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
