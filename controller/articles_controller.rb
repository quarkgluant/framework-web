class ArticlesController < BaseController
  def index
    @articles = Article.all
    render "index.html.erb"
  end
end