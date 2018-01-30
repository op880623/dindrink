Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "orders#new"
  post "/", to: "orders#create"
  get "/:hashid", to: "orders#show", as: :order
  match "/:hashid", to: "orders#update", via: [:patch, :put]
end
