Rails.application.routes.draw do
  devise_for :users, skip:  [:passwords, :registration],
        controllers: {
          omniauth_callbacks: 'users/omniauth_callbacks'
      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
