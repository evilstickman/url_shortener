class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render "/index"
  end

  def shrink_url
    url_from_user = params[:url]
    shortened_url = ShortenedUrl.create(url_from_user)
    render json: {shortened_url: shortened_url.shortened_url}
  end

  def redirect_to_url
    shortened_url = ShortenedUrl.where(url: params[:shortened_url]).first
    unless(shortened_url.nil?)
      redirect_to shortened_url.url
    else
      render "/error"
    end
  end
end
