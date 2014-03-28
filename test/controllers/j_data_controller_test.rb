require 'test_helper'

class JDataControllerTest < ActionController::TestCase
  setup do
    @j_datum = j_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:j_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create j_datum" do
    assert_difference('JDatum.count') do
      post :create, j_datum: { jInput: @j_datum.jInput, jOutput: @j_datum.jOutput }
    end

    assert_redirected_to j_datum_path(assigns(:j_datum))
  end

  test "should show j_datum" do
    get :show, id: @j_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @j_datum
    assert_response :success
  end

  test "should update j_datum" do
    patch :update, id: @j_datum, j_datum: { jInput: @j_datum.jInput, jOutput: @j_datum.jOutput }
    assert_redirected_to j_datum_path(assigns(:j_datum))
  end

  test "should destroy j_datum" do
    assert_difference('JDatum.count', -1) do
      delete :destroy, id: @j_datum
    end

    assert_redirected_to j_data_path
  end
end
