Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  namespace :admin do
    resources :programs
  end

  resources :programs do
    member do
      post :reserve_program
    end
  end

end
