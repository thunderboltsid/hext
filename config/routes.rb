Rails.application.routes.draw do
  resources :questions do
    post :send_sms, on: :collection
  end
  root 'questions#index'
end
