Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "shops#index"
  resources :shops, path: '', only: [:index, :create] do
    collection do
      get 'seedshops'
    end
    resources :orders, path: '', only: [:create, :show, :destroy], shallow: true do
      resources :entries, only: [:create, :destroy] do
        member do
          post 'update'
        end
      end
      member do
        get 'conclusion'
      end
    end
    resources :drinks, only: [:index, :create, :destroy], shallow: true
    member do
      patch 'update'
    end
  end
end
