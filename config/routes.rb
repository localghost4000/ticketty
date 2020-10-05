Rails.application.routes.draw do
  devise_for :users

  root "projects#index"

  namespace :admin do
    root 'application#index'

    resources :projects, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
    resources :states, only: [:index, :new, :create]
  end

  resources :projects, only: [:index, :show, :edit, :update] do
    resources :tickets do
      collection do
        post :upload_file
      end
    end
  end

  scope path: "tickets/:ticket_id", as: :ticket do
    resources :comments, oly: [:create]
  end

end
