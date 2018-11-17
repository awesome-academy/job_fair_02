Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "static_pages#home"
    devise_for :users
    resources :users, only: :show
    resources :jobs
    resources :curriculum_vitaes
    resources :curriculum_vitae_jobs, only: %i(new create)
    resources :organizations, only: %i(new create show)
    resources :tags, only: :show
  end
end
