Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  get "categories/:parent_id/subcategory/new" => "categories#new", as: :new_subcategory
  get "categories/:transfer_ids/to/:target_id" => "categories#transfer", as: :transfer_categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
