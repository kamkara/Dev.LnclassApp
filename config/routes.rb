Rails.application.routes.draw do
  resources :flash_cards
  
  #Course items
  resources :courses do
    resources :flash_cards, except:[:index, :show] do
      # resources :line_items, except: [:index, :show]
    end
  end
  
   #Home && Feed
  get "feed", to:'home#index'

  #Courses
  get "courses-show", to:"courses#show"
  get "course-list", to:"courses#index"
  get "lesson", to:"courses#new"
  
  #Dashboard
  get "dashboard", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "new-city", to:"citytowns#new"
  get "new-school", to:"schools#new"

  
  resources :courses
  resources :user_roles
  resources :schools
  resources :citytowns
  resources :materials
  resources :levels
  
  #Membership 
  devise_scope :user do
    get '/student-sign-in', to: 'devise/sessions#new'
    get '/student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete '/sign-out', to: 'devise/sessions#destroy'
  end

  devise_for :users
  root to:'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
