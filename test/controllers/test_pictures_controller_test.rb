require 'test_helper'

class TestPicturesControllerTest < ActionController::TestCase
  setup do
    @test_picture = test_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_picture" do
    assert_difference('TestPicture.count') do
      post :create, test_picture: {  }
    end

    assert_redirected_to test_picture_path(assigns(:test_picture))
  end

  test "should show test_picture" do
    get :show, id: @test_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_picture
    assert_response :success
  end

  test "should update test_picture" do
    patch :update, id: @test_picture, test_picture: {  }
    assert_redirected_to test_picture_path(assigns(:test_picture))
  end

  test "should destroy test_picture" do
    assert_difference('TestPicture.count', -1) do
      delete :destroy, id: @test_picture
    end

    assert_redirected_to test_pictures_path
  end
end
