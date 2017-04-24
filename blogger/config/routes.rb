Rails.application.routes.draw do
  root to: 'articles#index' #so that localhost:3000 will show the index page instead of the rails page
  resources :articles #This line tells Rails that we have a resource named articles and the router should expect requests to follow the RESTful model of web interaction (REpresentational State Transfer).
end
