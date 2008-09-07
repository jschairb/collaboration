require File.dirname(__FILE__) + '/../test_helper'
require 'sessions_controller'

# Re-raise errors caught by the controller.
class SessionsController; def rescue_action(e) raise e end; end

describe "SessionsController", ActionController::TestCase do
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :users

  it "should login and redirect" do
    post :create, :login => 'quentin', :password => 'monkey'
    session[:user_id].should.not == nil
    assert_response :redirect
  end

  it "should fail login and not redirect" do
    post :create, :login => 'quentin', :password => 'bad password'
    session[:user_id].should == nil
    assert_response :success
  end

  it "should logout" do
    login_as :quentin
    get :destroy
    session[:user_id].should == nil
    assert_response :redirect
  end

  it "should remember me" do
    @request.cookies["auth_token"] = nil
    post :create, :login => 'quentin', :password => 'monkey', :remember_me => "1"
    @response.cookies["auth_token"].should.not == nil
  end

  it "should not remember me" do
    @request.cookies["auth_token"] = nil
    post :create, :login => 'quentin', :password => 'monkey', :remember_me => "0"
    puts @response.cookies["auth_token"]
    @response.cookies["auth_token"].blank?.should.not == nil
  end
  
  it "should delete token on logout" do
    login_as :quentin
    get :destroy
    @response.cookies["auth_token"].blank?.should.not == nil
  end

  it "should login with cookie" do
    users(:quentin).remember_me
    @request.cookies["auth_token"] = cookie_for(:quentin)
    get :new
    @controller.send(:logged_in?).should.not == nil
  end

  it "should fail expired cookie login" do
    users(:quentin).remember_me
    users(:quentin).update_attribute :remember_token_expires_at, 5.minutes.ago
    @request.cookies["auth_token"] = cookie_for(:quentin)
    get :new
    @controller.send(:logged_in?).should.not == true
  end

  it "should fail cookie login" do
    users(:quentin).remember_me
    @request.cookies["auth_token"] = auth_token('invalid_auth_token')
    get :new
    @controller.send(:logged_in?).should.not == true
  end

  protected
    def auth_token(token)
      CGI::Cookie.new('name' => 'auth_token', 'value' => token)
    end
    
    def cookie_for(user)
      auth_token users(user).remember_token
    end
end
