Rails.application.routes.draw do

  get 'reviews/show'

  get 'reviews/edit'

  get 'reviews/new'

  resources :works do
    resources :reviews, :except => [:index]
  end
end
