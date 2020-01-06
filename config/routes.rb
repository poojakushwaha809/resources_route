Rails.application.routes.draw do
  devise_for :users
get 'all/articles', to: 'welcomes#index'
get 'like/:user_id/:article_id', to: 'likes#create', as: :like_dislike
get 'dislike/:user_id/:article_id', to: 'likes#destroy', as: :dislike


  root 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :articles do

		resources :comments do 
			resources :replies do
				resources :answers
			end

		end
	end
	  

end
