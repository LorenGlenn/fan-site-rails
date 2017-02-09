Rails.application.routes.draw do
root :to => 'works#index'

#custom routes to not require work_id parameter
match 'works/search' => 'works#search', :via => :get
match 'works/sort' => 'works#sort', :via => :get

  resources :works do
    resources :reviews, :except => [:index]
  end
end
