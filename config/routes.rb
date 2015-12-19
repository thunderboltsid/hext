Rails.application.routes.draw do
  resources :questions, except: [:edit, :update] do
    post :send_sms, on: :collection
  end
  root 'questions#index'
end
