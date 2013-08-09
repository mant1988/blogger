class ArticlesController < ApplicationController

  # before_filter :find_article , :except => [:new, :create]

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

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update_attributes(article_params)

    redirect_to articles_path
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def destroy
    @article.delete

    redirect_to articles_path
  end

  private

  # def find_article
  #   @article = Article.find_by_id(params[:id])
  #   # unless @article
  #   #   redirect_to articles_path
  #   # end
  # end
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
