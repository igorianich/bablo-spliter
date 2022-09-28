Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get :sign_up, to: 'v1/users#new'
  post :sign_up, to: 'v1/users#create'
  get :sign_in, to: 'v1/sessions#new'
  post :sign_in, to: 'v1/sessions#create'
  delete :logout, to: 'v1/sessions#destroy'
  get :groups, to: 'v1/groups#index'
  get 'groups/:id', to: 'v1/groups#show'

  root to: 'status#check'
end
