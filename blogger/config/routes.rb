Rails.application.routes.draw do
  root to: 'articles#index' #so that localhost:3000 will show the index page instead of the rails page
  resources :articles do #This line tells Rails that we have a resource named articles and the router should expect requests to follow the RESTful model of web interaction (REpresentational State Transfer).
    resources :comments #create article_comments_path
  end
  resources :tags #create a tag_path
  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
