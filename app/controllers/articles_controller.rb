class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created." # トップページに戻る
    else
      render :new, status: :unprocessable_entity# newのページに戻る
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully update." # トップページに戻る
    else
      render :new, status: :unprocessable_entity# updateのページに戻る
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
