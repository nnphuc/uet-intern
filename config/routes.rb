Rails.application.routes.draw do



  resources :msgs
  resources :follows,only: [:create, :destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :thuctaps, path: "thuctap"
  get "/update_info", to:"home#update_info"

  root to: "home#index"
  get "/dangnhap", to:"home#dangnhap"
  get "/congviec", to:"home#congviec"
  get "/thongbao", to:"home#thongbao"
  get "/myprofile",to: "home#myprofile"
  get "/search", to:"home#search"
  
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
