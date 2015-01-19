require 'test_helper'
require "helpers/url_helper"
require "shortened_url"

describe UrlHelper do
  
  context "generating a random hex string" do
    before(:each) do
      @url_helper = UrlHelper.new
    end
    
    it "generates an 8-character string" do
      expect(@url_helper.generate_url_token().length).to eq 8
    end
    
    it "generates a string with only hex characters" do
      expect(@url_helper.generate_url_token()).to match(/(a-f0-9)*/)
    end
  end

  context "generating a unique string" do
    before(:each) do

      @url_helper = UrlHelper.new
    end

    it "should try to find a unique string if the first string already exists" do
      allow(ShortenedUrl).to receive(:exists?).and_return(true, false)
      expect(@url_helper).to receive(:generate_url_token).twice
      @url_helper.get_unique_url_token
    end

    it "should return immediately if the generated token doesn't exist" do
      allow(ShortenedUrl).to receive(:exists?).and_return(false)
      expect(@url_helper).to receive(:generate_url_token).once
      @url_helper.get_unique_url_token
    end
  end
end