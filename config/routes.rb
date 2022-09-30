Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :v1 do
    get :sign_up, to: 'users#new'
    post :sign_up, to: 'users#create'
    get :sign_in, to: 'sessions#new'
    post :sign_in, to: 'sessions#create'
    delete :logout, to: 'sessions#destroy'
    resources :groups, only: %i[new create show index]
    post 'groups/new', to: 'groups#create'
    # get :groups, to: 'v1/groups#index'
    # get 'groups/new', to: 'v1/groups#new'
    # get 'groups/:id', to: 'v1/groups#show'
    # post :groups, to: 'v1/groups#create'
  end

  root to: 'status#check'
end
