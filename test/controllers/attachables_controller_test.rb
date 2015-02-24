require 'test_helper'

class AttachablesControllerTest < ActionController::TestCase
  setup do
    @attachable = attachables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attachables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attachable" do
    assert_difference('Attachable.count') do
      post :create, attachable: { attachable_type: @attachable.attachable_type, file_content_type: @attachable.file_content_type, file_file_name: @attachable.file_file_name, file_file_size: @attachable.file_file_size, file_fingerprint: @attachable.file_fingerprint, file_processing: @attachable.file_processing, file_updated_at: @attachable.file_updated_at, title: @attachable.title }
    end

    assert_redirected_to attachable_path(assigns(:attachable))
  end

  test "should show attachable" do
    get :show, id: @attachable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attachable
    assert_response :success
  end

  test "should update attachable" do
    patch :update, id: @attachable, attachable: { attachable_type: @attachable.attachable_type, file_content_type: @attachable.file_content_type, file_file_name: @attachable.file_file_name, file_file_size: @attachable.file_file_size, file_fingerprint: @attachable.file_fingerprint, file_processing: @attachable.file_processing, file_updated_at: @attachable.file_updated_at, title: @attachable.title }
    assert_redirected_to attachable_path(assigns(:attachable))
  end

  test "should destroy attachable" do
    assert_difference('Attachable.count', -1) do
      delete :destroy, id: @attachable
    end

    assert_redirected_to attachables_path
  end
end
