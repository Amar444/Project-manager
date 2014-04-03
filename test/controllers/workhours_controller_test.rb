require 'test_helper'

class WorkhoursControllerTest < ActionController::TestCase
  setup do
    @workhour = workhours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workhours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workhour" do
    assert_difference('Workhour.count') do
      post :create, workhour: { date_of_workhour: @workhour.date_of_workhour, hours: @workhour.hours, note: @workhour.note, project_id: @workhour.project_id, user_id: @workhour.user_id }
    end

    assert_redirected_to workhour_path(assigns(:workhour))
  end

  test "should show workhour" do
    get :show, id: @workhour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workhour
    assert_response :success
  end

  test "should update workhour" do
    patch :update, id: @workhour, workhour: { date_of_workhour: @workhour.date_of_workhour, hours: @workhour.hours, note: @workhour.note, project_id: @workhour.project_id, user_id: @workhour.user_id }
    assert_redirected_to workhour_path(assigns(:workhour))
  end

  test "should destroy workhour" do
    assert_difference('Workhour.count', -1) do
      delete :destroy, id: @workhour
    end

    assert_redirected_to workhours_path
  end
end
