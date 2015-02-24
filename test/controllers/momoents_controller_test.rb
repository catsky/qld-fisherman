require 'test_helper'

class MomoentsControllerTest < ActionController::TestCase
  setup do
    @momoent = momoents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:momoents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create momoent" do
    assert_difference('Momoent.count') do
      post :create, momoent: { address_id: @momoent.address_id, message_id: @momoent.message_id, user_id: @momoent.user_id }
    end

    assert_redirected_to momoent_path(assigns(:momoent))
  end

  test "should show momoent" do
    get :show, id: @momoent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @momoent
    assert_response :success
  end

  test "should update momoent" do
    patch :update, id: @momoent, momoent: { address_id: @momoent.address_id, message_id: @momoent.message_id, user_id: @momoent.user_id }
    assert_redirected_to momoent_path(assigns(:momoent))
  end

  test "should destroy momoent" do
    assert_difference('Momoent.count', -1) do
      delete :destroy, id: @momoent
    end

    assert_redirected_to momoents_path
  end
end
