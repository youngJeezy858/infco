Infco::Application.routes.draw do
  resources :ldap_entries
  resources :load_balancers
  resources :nagios_entries
  resources :automounts
  resources :printers
  resources :labs do
    resources :machines
  end

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
