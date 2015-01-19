require 'test_helper'
require 'rspec/active_model/mocks'
require 'rspec/rails'

describe ApplicationController, :type => :controller do
  before(:each) do
    @controller = ApplicationController.new
    @shortened_url = ShortenedUrl.new
  end
  
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should return a shortened url" do
    @shortened_url.stub(:url).and_return("http://www.google.com")
    @shortened_url.stub(:shortened_url).and_return("abcdef12")
    ShortenedUrl.stub(:create).and_return(@shortened_url)
    get :shrink_url, url: "http://www.google.com"
    expect(response.body).to eq "{\"shortened_url\":\"abcdef12\"}"
  end

  it "should throw an error when given an invalid url" do
    get :shrink_url, url: "this be fake"
    expect(response.body).to match(/submitted was not valid/)
  end
end
