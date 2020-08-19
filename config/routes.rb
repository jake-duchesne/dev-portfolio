Rails.application.routes.draw do

  	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
	resources :portfolios, except: [:show]
	
	resources :portfolios do
	  member do
		patch :move
	  end
	end
	resources :blogs do
		member do
			get :toggle_status
		end
	end


	root to: 'pages#home'

	get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
	get 'about', to: 'pages#about'
	get 'contact', to: 'pages#contact'
	get 'angular-items', to: 'portfolios#angular'

end
