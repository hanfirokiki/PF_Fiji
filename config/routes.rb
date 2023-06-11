Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  #devise_for :customers
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :reviews, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
  end

  scope module: :user do
    #root 'homes#top'
    #get 'homes/about' => 'homes#about'
    resources :users, only: [:edit, :update]
    get '/users/mypage' => 'users#show'
    get 'users/withdraw_confirm' => 'users#withdraw_confirm', as: 'withdraw_confirm'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :reviews, only: [:new, :index, :edit, :create, :update, :destroy, :show]
    resources :comments, only: [:cerate, :destroy] do
     collection do
        delete 'destroy_all'
      end
    end

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end