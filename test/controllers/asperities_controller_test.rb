require 'test_helper'

class AsperitiesControllerTest < ActionController::TestCase
  setup do
    @asperity = asperities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asperities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asperity" do
    assert_difference('Asperity.count') do
      post :create, asperity: { number: @asperity.number }
    end

    assert_redirected_to asperity_path(assigns(:asperity))
  end

  test "should show asperity" do
    get :show, id: @asperity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asperity
    assert_response :success
  end

  test "should update asperity" do
    patch :update, id: @asperity, asperity: { number: @asperity.number }
    assert_redirected_to asperity_path(assigns(:asperity))
  end

  test "should destroy asperity" do
    assert_difference('Asperity.count', -1) do
      delete :destroy, id: @asperity
    end

    assert_redirected_to asperities_path
  end
end
