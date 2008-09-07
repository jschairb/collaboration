require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

describe "UsersController", ActionController::TestCase do
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :users

  it "should allow signup" do
    assert_difference 'User.count' do
      create_user
      assert_response :redirect
    end
  end

  it "should require login on signup" do
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assigns(:user).errors.on(:login).should.not == nil
      assert_response :success
    end
  end

  it "should require password on signup" do
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assigns(:user).errors.on(:password).should.not == nil
      assert_response :success
    end
  end

  it "should require password confirmation on signup" do
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assigns(:user).errors.on(:password_confirmation).should.not == nil
      assert_response :success
    end
  end

  it "should require email on signup" do
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assigns(:user).errors.on(:email).should.not == nil
      assert_response :success
    end
  end
  

  

  protected
    def create_user(options = {})
      post :create, :user => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
