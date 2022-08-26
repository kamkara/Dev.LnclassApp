Rails.application.routes.draw do
  get "feed", to:'home#index'
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
