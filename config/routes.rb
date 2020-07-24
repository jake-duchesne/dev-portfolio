Rails.application.routes.draw do

	resources :portfolios, except: [:show]
	resources :blogs

	root to: 'pages#home'

	get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
	get 'about', to: 'pages#about'
	get 'contact', to: 'pages#contact'

end
