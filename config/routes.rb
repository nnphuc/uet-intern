Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :thuctaps, path: "thuctap"
  get "/update_info", to:"home#update_info"

  root to: "home#index"
  get "/dangnhap", to:"home#dangnhap"
  get "/congviec", to:"home#congviec"
  get "/thongbao", to:"home#thongbao"
  get "/myprofile",to: "home#myprofile"

  resources :home do
    post :update, :on => :collection
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
