Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'ui#home'

  root to: "pages#front"
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: "citizens#index"
  get 'register', to: "agents#new"
  get 'sign_in', to: "sessions#new"
  get 'sign_out', to: "sessions#destroy"
  get 'search', to: "citizens#search", as: 'citizens_search'
  patch 'verify_agent', to: "admins#verify_agent"

  resources :citizens, except: [:delete] do
    [:convocations, :flags, :restrictions, :convictions].each do |asset|
      resources asset, only: [:create, :update]
    end
  end

  resources :agents, only: [:index, :show, :create, :edit, :update, :create, :new]
  resources :sessions, only: [:create]

  [:convocations, :restrictions, :convictions, :flags].each do |route_resource|
    resources route_resource, only: [:index]
  end

  resources :stations, only: [:new]

  resources :admins, only: [:index] do 
    resources :agents, only: [:update]
  end
end
