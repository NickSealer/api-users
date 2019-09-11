Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users
      get 'health', to: 'health#health'
      get 'currentUser', to:'users#user'
    end
  end
end
