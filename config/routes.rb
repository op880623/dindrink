Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "orders#index"
  post "/:shop_id", to: "orders#create", as: :create_order
  get "/:hash_id", to: "orders#show", as: :order
  delete "/:hash_id", to: "orders#destroy"
  post "/entries/:hash_id", to: "entries#create", as: :create_entry
  match "/entries/:entry_id", to: "entries#update", via: [:patch, :put], as: :entry
  delete "/entries/:entry_id", to: "entries#destroy"
end
