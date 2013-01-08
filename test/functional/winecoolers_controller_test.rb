require 'test_helper'

class WinecoolersControllerTest < ActionController::TestCase
  setup do
    @winecooler = winecoolers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:winecoolers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create winecooler" do
    assert_difference('winecooler.count') do
      post :create, winecooler: { category_id: @winecooler.category_id, desc: @winecooler.desc, model: @winecooler.model }
    end

    assert_redirected_to winecooler_path(assigns(:winecooler))
  end

  test "should show winecooler" do
    get :show, id: @winecooler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @winecooler
    assert_response :success
  end

  test "should update winecooler" do
    put :update, id: @winecooler, winecooler: { category_id: @winecooler.category_id, desc: @winecooler.desc, model: @winecooler.model }
    assert_redirected_to winecooler_path(assigns(:winecooler))
  end

  test "should destroy winecooler" do
    assert_difference('winecooler.count', -1) do
      delete :destroy, id: @winecooler
    end

    assert_redirected_to winecoolers_path
  end
end
