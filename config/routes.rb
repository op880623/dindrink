Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "shops#index"
  resources :shops, path: '', only: [:index, :create] do
    resources :orders, path: '', only: [:create, :show, :destroy], shallow: true do
      resources :entries, only: [:create, :destroy] do
        member do
          post 'update'
        end
      end
    end
    resources :drinks, only: [:index, :create]
    delete 'drink', to: "drinks#destroy"
    member do
      patch 'update'
    end
  end
end
