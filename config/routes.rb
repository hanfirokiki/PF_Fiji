Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  get "searches" => "searches#searches"

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  #devise_for :customers
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :categories, only: [:index, :show, :edit, :create, :update]

  end

  scope module: :user do
    get 'users/withdraw_confirm' => 'users#withdraw_confirm', as: 'withdraw_confirm'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'

    resources :users, only: [:edit, :update]
    get '/users/mypage/:id' => 'users#show', as: "mypage"
    resources :categories, only: [:show]
    resources :reviews do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end