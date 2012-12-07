TopTen::Application.routes.draw do
  get "ratings/create"


  get "videos/show"
  get 'videos/create'


  get "admin/index"
  get "admin/search"

  get "comedians/show"
  post "comedians/update"

  get "dashboard/shuffle"

  get "comments/random"

  match "comments/random", :as => "comments_random_path"

  match "comedians/update", :as => 'comedians_update_path'

  match "admin/search", :as => 'admin_search_path'

  devise_for :users

  resources :dashboard

  resources :videos do
    resources :comments
  end

  root to: "home#index"

end
