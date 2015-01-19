require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  it "should allow searching by url tokens" do
    assert_includes UrlHelper.find.where({shortened_url: "abcdef12"}), shortened_urls(:google)
    refute_includes UrlHelper.find.where({shortened_url: "abcdef34"}), shortened_urls(:google)
  end
end
