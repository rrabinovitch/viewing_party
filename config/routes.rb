Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index", as: "root"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/dashboard", to: "dashboard#show"
  get "/discover", to: "discover#index"
  get "/movies", to: "movies#index"
  post "/friendships", to: "friendships#create"
end
