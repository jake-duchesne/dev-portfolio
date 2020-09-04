Rails.application.routes.draw do

	resources :topics, only: [:index, :show]

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

	mount ActionCable.server => '/cable'


	root to: 'pages#home'

	get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
	get 'about', to: 'pages#about'
	get 'contact', to: 'pages#contact'
	get 'tech-news', to: 'pages#tech_news'
	get 'angular-items', to: 'portfolios#angular'

end
