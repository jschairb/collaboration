require 'test_helper'

describe "MessagesController", ActionController::TestCase do
  it "should get index" do
    get :index
    assert_response :success
    assigns(:messages).should.not == nil
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create message" do
    assert_difference('Message.count') do
      post :create, :message => { }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  it "should show message" do
    get :show, :id => messages(:one).id
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => messages(:one).id
    assert_response :success
  end

  it "should update message" do
    put :update, :id => messages(:one).id, :message => { }
    assert_redirected_to message_path(assigns(:message))
  end

  it "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, :id => messages(:one).id
    end

    assert_redirected_to messages_path
  end
end
