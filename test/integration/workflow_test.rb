require 'test_helper'

class WorkflowTest < ActionDispatch::IntegrationTest

  def article
    @article ||= articles(:one)
  end
  def category
    categories(:additional)
  end

  test 'can update categories of an article' do
    patch_via_redirect article_path(article), id: article.id, article: {category_ids: [category.id]}
    assert_response :ok
    assert_select '#notice', 'Article was successfully updated.'
    assert_includes article.categories, category
  end

  test 'Bonus Frage:' do
    skip 'Warum *MUSS* der test "can update categories of an article" als Integrationstest geschrieben werden?'
  end

end