Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resource :forecast, only: [:new, :create, :show] do
    collection do
      get '/:id', to: 'forecasts#show'
    end
  end

  get '/err_404', to: 'errors#error_404'
end
