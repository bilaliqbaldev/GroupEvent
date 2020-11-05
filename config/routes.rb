Rails.application.routes.draw do

  resources :group_events do
    collection do
      post :publish_event
    end
  end
  resources :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users do
        post :restore_user
      end
      resources :group_events do
        post :publish_event
      end
    end
  end

  root :to => "group_events#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
