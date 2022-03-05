Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'

  devise_for :players,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

namespace :admin do
    resources :players
    resources :quizzes
    resources :request_quizzes
  end

namespace :user do
    resources :players
    resources :quizzes
    resources :request_quizzes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
