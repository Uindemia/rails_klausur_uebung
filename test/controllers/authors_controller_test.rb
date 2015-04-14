require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, author: { email: @author.email, username: @author.username }
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should update author" do
    patch :update, id: @author, author: { email: @author.email, username: @author.username }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end

  test 'cant create invalid author' do
    post :create, author: {password: 'public'}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Email can't be blank"
    end
  end

  test 'cant update an invalid author' do
    post :update, id: @author, author: {email: nil}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Email can't be blank"
    end
  end
end
