Rails.application.routes.draw do
  devise_for :users

	root to: 'groops#index'

	resources :groops, except: :index
end
