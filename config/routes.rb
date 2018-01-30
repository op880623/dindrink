Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "orders#index"
  post "/:shopid", to: "orders#create", as: :create_order
  get "/:hashid", to: "orders#show", as: :order
  match "/:hashid", to: "orders#update", via: [:patch, :put]
end
