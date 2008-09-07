require 'test_helper'

describe "PresenceController", ActionController::TestCase do
  it "should get index" do
    get :index
    assert_response :success
    assigns(:presence).should.not == nil
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create presence" do
    assert_difference('Presence.count') do
      post :create, :presence => { }
    end

    assert_redirected_to presence_path(assigns(:presence))
  end

  it "should show presence" do
    get :show, :id => presence(:one).id
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => presence(:one).id
    assert_response :success
  end

  it "should update presence" do
    put :update, :id => presence(:one).id, :presence => { }
    assert_redirected_to presence_path(assigns(:presence))
  end

  it "should destroy presence" do
    assert_difference('Presence.count', -1) do
      delete :destroy, :id => presence(:one).id
    end

    assert_redirected_to presence_path
  end
end
