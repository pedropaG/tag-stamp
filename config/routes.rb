Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tags, only: [:index] do
    post 'preview', on: :collection
    get 'preview', on: :collection
    post 'print', on: :collection
    post 'upload_file', on: :collection
  end
  resources :users, except: [:index, :show, :create]
  resources :orders, only: [:edit, :update] do
    get 'toggle_printed', on: :member
  end
  
  root 'tags#index'
end
