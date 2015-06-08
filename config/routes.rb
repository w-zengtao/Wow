Rails.application.routes.draw do


  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:index, :show, :create, :update, :destroy] do 
        member do 

        end
      end
      resources :user_tokens, only: [:create, :destroy]
      resources :devices, only: [:index, :show, :create, :update, :destroy]

      resources :posts, only: [:create, :update, :destroy, :show, :index] do
        collection do 
          get :user_posts
          get :dis_posts
        end
      end

      resources :locations, only: [:index]
    end
  end
  
end
