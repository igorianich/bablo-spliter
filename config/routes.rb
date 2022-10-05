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
    get 'profile/edit_password', to: 'users#edit_password'
    patch 'profile/update_password', to: 'users#update_password'
    delete :logout, to: 'sessions#destroy'
    resources :groups do
      resources :expenses, only: %i[create new] #do
      #     get :new
      #     post :new, to: 'groups#create'
      # end
    end
    post 'groups/new', to: 'groups#create'
    resources :friends, only: %i[index show new create delete]
  end

  root to: 'status#check'
end
