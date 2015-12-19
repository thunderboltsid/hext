Rails.application.routes.draw do
  devise_for :users
  resources :questions, except: [:edit, :update] do
    post :send_sms, on: :collection
  end
  root 'questions#index'
end
