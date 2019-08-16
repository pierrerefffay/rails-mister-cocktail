Rails.application.routes.draw do
  resources :cocktails, only: %i[index show new create destroy] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :doses, only: %i[new create]
  end
  resources :doses, only: %i[destroy]
end
