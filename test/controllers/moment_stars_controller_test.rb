require 'test_helper'

class MomentStarsControllerTest < ActionController::TestCase
  setup do
    @moment_star = moment_stars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moment_stars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moment_star" do
    assert_difference('MomentStar.count') do
      post :create, moment_star: { moment_id: @moment_star.moment_id, user_id: @moment_star.user_id }
    end

    assert_redirected_to moment_star_path(assigns(:moment_star))
  end

  test "should show moment_star" do
    get :show, id: @moment_star
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moment_star
    assert_response :success
  end

  test "should update moment_star" do
    patch :update, id: @moment_star, moment_star: { moment_id: @moment_star.moment_id, user_id: @moment_star.user_id }
    assert_redirected_to moment_star_path(assigns(:moment_star))
  end

  test "should destroy moment_star" do
    assert_difference('MomentStar.count', -1) do
      delete :destroy, id: @moment_star
    end

    assert_redirected_to moment_stars_path
  end
end
