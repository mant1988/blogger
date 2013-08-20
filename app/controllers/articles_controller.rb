class ArticlesController < ApplicationController

  before_filter :find_article , :only => [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created! "

    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update_attributes(article_params)

    flash.notice = "Article '#{@article.title}' Updated! "

    redirect_to articles_path
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def destroy
    @article.delete

    flash.notice = "Article was Deleted! "

    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find_by_id(params[:id])
    unless @article
      redirect_to articles_path and return
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

end
