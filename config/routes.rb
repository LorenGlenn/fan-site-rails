Rails.application.routes.draw do

  resources :works do
    resources :reviews, :except => [:index]
  end
end
