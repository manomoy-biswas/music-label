Rails.application.routes.draw do
  root "home#index"
  get "/overview", to: "home#overview", as: "overview" 
  resources :users
  resources :events do
    resources :performance do
      resources :comments
    end
  end

  resources :sessions
end
