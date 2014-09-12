Infco::Application.routes.draw do

  devise_for :users

  get "schedule/index"
  resources :office_cleanings_schedules
  resources :reloud_schedules
  resources :weekly_schedules

  resources :ldap_entries
  resources :load_balancers
  resources :nagios_entries
  resources :automounts
  resources :printers
  resources :labs do
    resources :machines
  end

  resources :operations_checks do
    get 'sign_off', on: :member
    resources :lab_checks do 
      collection do
        post 'mass_create'
      end
    end
    resources :ldap_checks do
      collection do
        post 'mass_create'
      end
    end
    resources :load_balancer_checks do
      collection do
        post 'mass_create'
      end
    end
    resources :rt_checks
    resources :nagios_checks do
      collection do
        post 'mass_create'
      end
    end
    resources :automount_checks do
      collection do
        post 'mass_create'
      end
    end
    resources :printer_checks do
      collection do
        post 'mass_create'
      end
    end
    resources :mail_checks
    resources :packages_checks
  end
  resources :loud_checks
#  match '/printer_checks', to: "printer_check#mass_create", :via => 'post', as: 'mass_create'

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
