Cats99::Application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create, :update, :edit]
  resources :cat_rental_requests, only:[:new, :create] do
    post "approve", :on => :member
    post "deny", :on => :member
  end

  resource :session
  resources :users

  root to: "cats#index"

end
