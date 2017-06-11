Rails.application.routes.draw do
	root to: 'groops#index'

  devise_for :users

	resources :groops
end
