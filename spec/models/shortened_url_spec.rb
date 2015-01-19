require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  fixtures :shortened_urls
  
  test "should allow searching by url tokens" do
    assert_includes ShortenedUrl.where({shortened_url: "abcdef12"}), shortened_urls(:google)
    refute_includes ShortenedUrl.where({shortened_url: "abcdef34"}), shortened_urls(:google)
  end
end
