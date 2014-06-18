Infco::Application.routes.draw do
  resources :admin_tools

  resources :backup_entries


  resources :space_entries


  resources :space_checks


  resources :backup_checks


  resources :internal_checks


  root to: 'welcome#index'
  get "welcome/index"

end
