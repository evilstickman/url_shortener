Rails.application.routes.draw do
  get '/' => 'application#index'
  put '/shrink_url' => 'application#shrink_url'
  get '/:shortened_url' => 'application#redirect_to_url'
end
