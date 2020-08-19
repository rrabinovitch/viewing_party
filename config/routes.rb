Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: 'root'
  get '/auth/google_oauth2', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  # is the following route in case Google authentication fails?
  # get 'auth/failure', to: redirect('/')
end
