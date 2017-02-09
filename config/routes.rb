Rails.application.routes.draw do
root :to => 'works#index'

  resources :works do
    get "sort"
    get "search"
    resources :reviews, :except => [:index]
  end
end
