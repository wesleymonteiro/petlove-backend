Rails.application.routes.draw do
  root "questions#index"

  resources :animals, except: :show
  resources :curators, except: :show
end
