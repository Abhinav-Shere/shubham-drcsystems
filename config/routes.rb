Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  # config/routes.rb
  root 'doctors#index'
  resources :doctors do
    # Nested routes for doctor's availabilities
    resources :availabilities, only: [:index, :new, :create]
    # Nested routes for doctor's appointments
    resources :appointments, only: [:index, :show, :new, :create]
  end

  # Routes for patients
  resources :patients do
    # Nested routes for patient's appointments
    resources :appointments, only: [:index, :show, :new, :create]
  end

  # Routes for appointments
  resources :appointments, only: [:show]
end

