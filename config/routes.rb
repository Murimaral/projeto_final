Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'home#index'
   resources :companies 
   resources :colaborators do
    get 'search', on: :collection
   end
   resources :ads do
    get 'owned',on: :collection
    get 'disab', on: :member
    get 'enab', on: :member
    resources :questions
    get 'search', on: :collection
    resources :deals do
        post 'paycheck', to: 'payment#create'
        resources :payments, only: [:new, :create, :show]
      end
    end 
end


#resources ‘collaborator’, only: [:show] do
 # get ‘products’, on: :member
  #end