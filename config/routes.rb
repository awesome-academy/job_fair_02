Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "static_pages#home"
    devise_for :users
    resources :users, only: :show
    resources :jobs
    resources :curriculum_vitaes
  end
end
