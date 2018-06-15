Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  get "categories/:parent_id/subcategory/new" => "categories#new", as: :new_subcategory
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
