require 'test_helper'

class ApplicationControllerSpec < ActionController::TestCase
  def setup
    @controller = ApplicationController.new
  end
  test "should get index" do
    get :index
    assert_response :success
  end
end