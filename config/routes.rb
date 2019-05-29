Rails.application.routes.draw do
  # root 'projects#index'
  root 'static_pages#home'

  resources :projects, param: :slug do
    resources :proposals, param: :slug do
      member do
        get :send_email
      end
      resources :comments
    end
  end

  resources :proposals

  resources :users

  # get 'new_user_path', to: 'users#new', as: "signup_path"
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/create_account', to: "users#new"
end
#
# resources :users
#
# All the below from typing just the above
#
# namespace :users do
#   member do
#     get :show
#     get :edit
#     puts :update
#     delete :destroy
#   end
#   collection do
#     get :index
#     get :new
#     post :create
#   end
# end
