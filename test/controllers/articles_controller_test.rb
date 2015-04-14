require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select 'table', count: 0
    assert_select 'section', count: Article.all.count
  end

  test "index looks nice" do
    get :index
    assert_select 'section.ui.segment' do
      Article.all.each do |article|
        assert_select '.ui.ribbon.label > h1 > a', article.title
      end
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { author_id: @article.author_id, content: @article.content, publish_at: @article.publish_at, publish_until: @article.publish_until, teaser: @article.teaser, title: @article.title }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
    assert_select '.ui.ribbon.label > h1', @article.title
    assert_select 'p > b', @article.teaser
    assert_select 'p', @article.content
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test 'form looks nice' do
    get :edit, id: @article
    assert_select 'form.ui.form'
  end

  test 'the author is a select box' do
    get :new
    assert_select 'select#article_author'
    assert_select 'select#article_author > option', count: Author.count
  end

  test "should update article" do
    patch :update, id: @article, article: { author_id: @article.author_id, content: @article.content, publish_at: @article.publish_at, publish_until: @article.publish_until, teaser: @article.teaser, title: @article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end

  test 'should not show expired articles in index' do
    get :index
    Article.expired.ids.each do |id|
      assert_select "section[data-id=\"#{id}\"]", count: 0
    end
  end

  test 'show categories as links' do
    get :index
    Article.all.each do |article|
      assert_select "section[data-id=\"#{article.id}\"] .ui.buttons" do
        article.categories.each do |category|
          assert_select 'a.ui.button', category.name
        end
      end
    end
  end

  test 'cant create invalid article' do
    post :create, article: {author_id: nil}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Author can't be blank"
    end
  end

  test 'cant update an invalid article' do
    post :update, id: @article, article: {content: ''}
    assert_response :ok
    assert_select '#error_explanation ul' do
      assert_select 'li', "Content can't be blank"
    end
  end

  test 'index page has valid links' do
    get :index
    assert_response :ok
    assert_select "section.ui.segment[data-id=\"#{@article.id}\"]" do
      assert_select "h1 > a[href=\"#{article_path(@article)}\"]"

    end
  end

  test 'show-action has valid links' do
    get :show, id: @article.id
    assert_response :ok
    @article.categories.each do |category|
      assert_select "a.ui.button[href=\"#{category_path category}\"]"
    end
  end

end
