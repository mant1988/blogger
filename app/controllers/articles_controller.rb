class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def destroy

  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
