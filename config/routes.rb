Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get :sign_up, to: 'v1/users#new'
  post :sign_up, to: 'v1/users#create'
  delete :logout, to: 'v1/sessions#destroy'

  root to: 'status#check'
end
