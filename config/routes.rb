Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :questions, except: [:edit, :update] do
    get :feed, to: 'questions#feed', on: :collection
    get :get_shorten_link, to: 'questions#get_shorten_link'
    resources :answers
    post :send_sms, on: :collection
  end
  root 'questions#index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
