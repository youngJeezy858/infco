Infco::Application.routes.draw do
  resources :admin_tools
  resources :backup_entries
  resources :space_entries

  resources :internal_checks do
    resources :backup_checks
    resources :space_checks
  end

  root to: 'welcome#index'
  get "welcome/index"

end
