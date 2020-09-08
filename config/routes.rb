Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'home#index'
   resources :companies, :colaborators
   resources :ads do
    get 'owned',on: :collection
    resources :questions
    resources :negociations do
      get 'onlyus', on: :member
      get 'arrange', to: 'negociations#arrange', method: :get do
        get 'complete', to: 'negociations#complete', method: :post
      end 
      resources :deals do
        resources :payments, only: [:show, :edit, :update]
      end
    end 
   end
end


#resources ‘collaborator’, only: [:show] do
 # get ‘products’, on: :member
  #end