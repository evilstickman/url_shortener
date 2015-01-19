require 'test_helper'
require 'rspec/active_model/mocks'
require 'rspec/rails'

describe ApplicationController, :type => :controller do
  before(:each) do
    @controller = ApplicationController.new
    @shortened_url = ShortenedUrl.new("www.google.com")
    @shortened_url.stub(:url).and_return("www.google.com")
    @shortened_url.stub(:shortened_url).and_return("abcdef12")
    ShortenedUrl.stub(:create).and_return(@shortened_url)
  end
  
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should return a shortened url" do
    get :shrink_url, url: "www.google.com"
    response.body.should == "{\"shortened_url\":\"abcdef12\"}"
  end
end
