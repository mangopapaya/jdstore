Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  namespace :admin do
    resources :programs
  end

  namespace :account do
    resources :orders
  end

  resources :programs do
    member do
      post :reserve_program
    end
  end

  resources :reservations do
    collection do
      delete :clean
        post :checkout
    end
  end

  resources :reserved_programs

  resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
      end
  end

end
