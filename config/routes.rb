Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index", as: "root"
  get "auth/:provider/callback", to: "sessions#googleAuth"
  # get "auth/failure", to: redirect("/") << this is from the medium article walkthrough - leaving it commented out until we work on a sadpath
end
