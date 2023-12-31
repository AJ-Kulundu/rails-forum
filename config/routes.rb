Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :communities, path:"community" do
    resources :members, only: %i[create destroy] ,path_names: { create: 'join', destroy: 'leave' }
    resources :posts
  end
end
