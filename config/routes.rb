Rails.application.routes.draw do


  get 'users/new'

  get 'users/edit'

  get 'users/index'

  get 'users/show'

  devise_for :users
  get 'home/index'

	resources :projects do
	  resources :cards, except: [:show, :index] do
	  	collection { post :sort }
	  end
	end  

   root 'home#index'
end
