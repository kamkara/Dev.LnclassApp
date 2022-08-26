Rails.application.routes.draw do
  resources :user_roles
  resources :schools
  resources :citytowns
  resources :materials
  resources :levels

   #Home && Feed
  get "feed", to:'home#index'
  
  #Dashboard
  get "dashboard", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "new-city", to:"citytowns#new"
  get "new-school", to:"schools#new"

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'student_sign_up', to: 'devise/registrations#new'
  end
  devise_for :users
  root to:'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
