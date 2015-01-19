require 'helpers/url_helper'

class ShortenedUrl < ActiveRecord::Base
  attr_accessor :url, :shortened_url
  def initialize(url)
    @url = url
    @shortened_url = get_unique_identifier
  end

  def get_unique_identifier
    url_helper.get_unique_url_token
  end

  private
  def url_helper
    @url_helper ||= UrlHelper.new
  end
end
