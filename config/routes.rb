Rails.application.routes.draw do
root :to => 'works#index'

  resources :works do
    resources :reviews, :except => [:index]
  end
end
