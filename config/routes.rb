Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :workers, skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
  }

  devise_scope :worker do
    post 'workers/guest_sign_in', to: 'worker/sessions#guest_sign_in'
  end

  devise_scope :worker do
    delete 'workers/guest_sign_out', to: 'worker/sessions#guest_sign_out'
  end

  root to: "worker/homes#top"
  get '/about', to: 'worker/homes#about', as: 'about'

  get '/admin', to: 'admin/homes#top'

  namespace :admin do
    resources :clients, only: [:index, :create, :edit, :update]
  end

  scope module: :worker do
    resources :jobs, except: [:new, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
