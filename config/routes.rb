Infco::Application.routes.draw do
  resources :operations_checks do
  end

  resources :admin_tools
  resources :reloud_entries
  resources :backup_entries
  resources :space_entries

  resources :internal_checks do
    get :sign_off, on: :member
    resources :backup_checks
    resources :space_checks
  end
  resources :reloud_checks

  root to: 'welcome#index'
  get "welcome/index"

end
