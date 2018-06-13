Rails.application.routes.draw do
  resources :follows,only: [:create, :destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :thuctaps, path: "thuctap"
  get "/update_info", to:"home#update_info"

  root to: "home#index"
  get "/dangnhap", to:"home#dangnhap"
  get "/congviec", to:"home#congviec"
  get "/thongbao", to:"home#thongbao"
  get "/myprofile",to: "home#myprofile"

  devise_for :users
  mount ActionCable.server, at: "/cable"

  get "/partner/:id/thuctap", to: "partner/thuctap#index"

  get "/:role/:id/profile", to: "home#viewprofile"

  resources :home do
    patch :update, :on => :collection
    post :update, :on => :collection
  end


    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  devise_for :users,skip: [:sessions,:registrations]
end
