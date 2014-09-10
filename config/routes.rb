Rails.application.routes.draw do
  root to: 'nonprofits#index'

  devise_for :users
  resources :nonprofits do
    resources :donations
    resources :subscriptions
  end
end
