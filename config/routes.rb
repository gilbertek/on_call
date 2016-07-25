Rails.application.routes.draw do
  resources :specialties
  resources :ailments

  resources :patients do
    resources :appointments, only: %w(create new show destroy)
  end

  resources :doctors do
    resources :appointments, only: %w(index show)
  end

  root 'patients#index'
end
