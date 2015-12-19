Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :questions, except: [:edit, :update] do
    post :send_sms, on: :collection
  end
  root 'questions#index'
end
