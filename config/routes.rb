Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :bakeries, only: [:index, :create, :new, :destroy]
  end
  
  namespace :admin do
    get 'reviews', to: 'reviews#index'
    resources :reviews, only: [:destroy]
  end
  
  
  devise_for :users
  root to: "public/homes#top"
  scope module: :public do
    resources :users, only: [:edit, :index, :show, :update]
    resources :reviews, only: [:create, :edit, :update, :destroy, :index, :show] do
      collection do
        get :search
      end
      resource :favorite, only: [:create, :destroy]
    end
    resources :rankings, only: [:index]
  end
end
