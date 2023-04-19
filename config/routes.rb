Rails.application.routes.draw do
  resources :articles do
    member do
      post :publish
      post :hide
    end
    collection do
      get :my_articles
      get :search
    end
    resources :comments
  end
  resources :tags
  resources :categories
  root "articles#index"
  devise_for :users
end
