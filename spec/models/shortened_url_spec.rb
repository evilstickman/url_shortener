require 'test_helper'

describe ShortenedUrl, :type => :model do
  it "should mark a record invalid with a bad URI" do
    su = ShortenedUrl.create(url: "www.google.com", shortened_url: "abcde12")
    expect(su.valid?).not_to be_truthy
    su = ShortenedUrl.create(url: "http://www.google.com", shortened_url: "abcde12")
    expect(su.valid?).to be_truthy
  end
end
