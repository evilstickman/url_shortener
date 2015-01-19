
require 'helpers/url_helper'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    render "/index"
  end

  def shrink_url
    url_from_user =  URI.decode(params[:url])
    shortened_url = ShortenedUrl.create(url: url_from_user, shortened_url: get_unique_identifier)
    if(shortened_url.valid?)
      shortened_url.save
      render json: {shortened_url: shortened_url.shortened_url}
    else
      render json: {errors: "The URL submitted was not valid"}, status: 422
    end
  end

  def redirect_to_url
    shortened_url = ShortenedUrl.where(shortened_url: params[:shortened_url]).first
    unless(shortened_url.nil?)
      redirect_to shortened_url.url
    else
      require 'pry'
      binding.pry
      render "/error"
    end
  end

  private

  def get_unique_identifier
    url_helper.get_unique_url_token
  end

  def url_helper
    @url_helper ||= UrlHelper.new
  end
end
