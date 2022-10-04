Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :v1 do
    get :sign_up, to: 'users#new'
    post :sign_up, to: 'users#create'
    get :sign_in, to: 'sessions#new'
    post :sign_in, to: 'sessions#create'
    get :profile, to: 'users#show'
    get 'profile/edit', to: 'users#edit'
    patch 'profile/update', to: 'users#update'
    delete :logout, to: 'sessions#destroy'
    resources :groups do
      resources :expenses, only: %i[create new] #do
      #     get :new
      #     post :new, to: 'groups#create'
      # end
    end
    post 'groups/new', to: 'groups#create'
    # post 'expenses/new', to: 'expenses#create'
    # get 'groups/:id/expenses/new', to: 'expenses#create'
    # post 'groups/:id/expenses/new'
    # resources :expenses, only: %i[new show]
    # post 'expenses/new', to: 'expenses#create'

  end

  root to: 'status#check'
end
