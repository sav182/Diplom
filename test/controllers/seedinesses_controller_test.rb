require 'test_helper'

class SeedinessesControllerTest < ActionController::TestCase
  setup do
    @seediness = seedinesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seedinesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seediness" do
    assert_difference('Seediness.count') do
      post :create, seediness: { drawing: @seediness.drawing, form: @seediness.form, number: @seediness.number, type: @seediness.type }
    end

    assert_redirected_to seediness_path(assigns(:seediness))
  end

  test "should show seediness" do
    get :show, id: @seediness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seediness
    assert_response :success
  end

  test "should update seediness" do
    patch :update, id: @seediness, seediness: { drawing: @seediness.drawing, form: @seediness.form, number: @seediness.number, type: @seediness.type }
    assert_redirected_to seediness_path(assigns(:seediness))
  end

  test "should destroy seediness" do
    assert_difference('Seediness.count', -1) do
      delete :destroy, id: @seediness
    end

    assert_redirected_to seedinesses_path
  end
end
