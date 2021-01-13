Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :dashboard, action: :index
  resources :dashboard
  resources :patients do
    get :therapists
    get '/therapists/:id', to: 'patients#show_therapist', as: 'show_therapist'
    get :patient_appointments
    resources :appointments
  end
  resources :therapists do
    resources :appointments
  end
  resources :appointments do
    get :cancle_appointment, on: :member
    patch :cancle
  end
end
