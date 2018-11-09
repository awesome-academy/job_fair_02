Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "static_pages#home"
    devise_for :users
  end
end
