Rails.application.routes.draw do

  devise_for :admin_users, 
              class_name: "Admin::User",
              path: 'admin'
  
  namespace :admin do
    resources :tenants do
      resources :users
    end
  end
  
  devise_for :tenant_users, 
              class_name: "Tenant::User",
              path: 'tenants'
              # path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', 
              #   confirmation: 'verification', unlock: 'unblock', registration: 'register', 
              #   sign_up: 'cmon_let_me_in' 
              # }

  resources :tenants do
    resources :users, class_name: "Tenant::User", controller: "tenant/users",
    only: [:index, :show]
  end
  
  root to: "tenants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
