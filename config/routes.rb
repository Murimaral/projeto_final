Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'home#index'
   resources :companies, :colaborators
   resources :ads do
    get 'owned',on: :collection
    resources :questions
    resources :negociations
   end
end


#resources ‘collaborator’, only: [:show] do
 # get ‘products’, on: :member
  #end