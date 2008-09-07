require 'test_helper'

describe "RoomsController", ActionController::TestCase do
  it "should get index" do
    get :index
    assert_response :success
    assigns(:rooms).should.not == nil
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create room" do
    assert_difference('Room.count') do
      post :create, :room => { }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  it "should show room" do
    get :show, :id => rooms(:one).id
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => rooms(:one).id
    assert_response :success
  end

  it "should update room" do
    put :update, :id => rooms(:one).id, :room => { }
    assert_redirected_to room_path(assigns(:room))
  end

  it "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, :id => rooms(:one).id
    end

    assert_redirected_to rooms_path
  end
end
