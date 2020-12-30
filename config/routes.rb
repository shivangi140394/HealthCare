Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :dashboard, action: :index
  resources :dashboard
  resources :patients do
    collection do
      get :patient_appointments
    end
  end
  resources :therapists
  resources :appointments do
    get :cancle_appointment, on: :member
    patch :cancle
  end
end
