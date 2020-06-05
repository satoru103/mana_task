Rails.application.routes.draw do
  devise_for :users
  root to:"top#index"

  resources :tasklists, only: [:new,:create,:edit,:update,:destroy] do
    resources :cards, except:[:index]
  end
end
