Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "shops#index"
  resources :shops, path: '', only: :index do
    resources :orders, path: '', only: [:create, :show, :destroy], shallow: true do
      resources :entries, only: [:create, :update, :destroy]
    end
    resources :drinks, only: :create
    delete 'drink', to: "drinks#destroy"
  end
end
