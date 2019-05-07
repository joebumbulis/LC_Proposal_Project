Rails.application.routes.draw do
  get 'user/index'
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

  root 'projects#index'
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
