require 'test_helper'

class WriteInsControllerTest < ActionController::TestCase
  setup do
    @write_in = write_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:write_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create write_in" do
    assert_difference('WriteIn.count') do
      post :create, write_in: { address: @write_in.address, input: @write_in.input }
    end

    assert_redirected_to write_in_path(assigns(:write_in))
  end

  test "should show write_in" do
    get :show, id: @write_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @write_in
    assert_response :success
  end

  test "should update write_in" do
    patch :update, id: @write_in, write_in: { address: @write_in.address, input: @write_in.input }
    assert_redirected_to write_in_path(assigns(:write_in))
  end

  test "should destroy write_in" do
    assert_difference('WriteIn.count', -1) do
      delete :destroy, id: @write_in
    end

    assert_redirected_to write_ins_path
  end
end
