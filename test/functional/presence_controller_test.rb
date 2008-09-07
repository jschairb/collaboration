require 'test_helper'

class PresenceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presence)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presence" do
    assert_difference('Presence.count') do
      post :create, :presence => { }
    end

    assert_redirected_to presence_path(assigns(:presence))
  end

  test "should show presence" do
    get :show, :id => presence(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => presence(:one).id
    assert_response :success
  end

  test "should update presence" do
    put :update, :id => presence(:one).id, :presence => { }
    assert_redirected_to presence_path(assigns(:presence))
  end

  test "should destroy presence" do
    assert_difference('Presence.count', -1) do
      delete :destroy, :id => presence(:one).id
    end

    assert_redirected_to presence_path
  end
end
