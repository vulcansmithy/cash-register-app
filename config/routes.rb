Rails.application.routes.draw do
  # Root route to the checkout index
  root "checkout#index"

  # Routes for the checkout controller
  resources :checkout, only: [ :index ] do
    # Add routes for add and remove actions
    collection do
      post :add
      delete :remove
    end
  end
end
