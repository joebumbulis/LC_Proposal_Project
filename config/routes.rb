Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'

  resources :projects, param: :slug do
    resources :proposals, param: :slug do
      resources :comments
    end
  end

  resources :proposals

end
