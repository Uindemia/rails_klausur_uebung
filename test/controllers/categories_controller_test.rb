require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_select 'table', count: 0
    assert_select '.ui.divided.animated.list' do
      assert_select 'a.item', count: Category.count
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { name: "#{@category.name} #{Category.count}" }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
    assert_select 'section.ui.segment' do
      @category.articles.published.each do |article|
        assert_select '.ui.ribbon.label > h1 > a', article.title
      end
    end
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end

  test 'cant create invalid category' do
    post :create, category: {name: Category.all.sample.name}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Name has already been taken"
    end
  end

  test 'cant update an invalid category' do
    post :update, id: @category, category: {name: nil}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Name can't be blank"
    end
  end

end
