Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "monitorings#index"

  resources :monitorings
  put "monitorings/switch_status/:id", to: "monitorings#switch_status", as: "switch_status"
end
