class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

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
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}が正常に作成されました." # トップページに戻る
    else
      render :new, status: :unprocessable_entity# newのページに戻る
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "#{t('activerecord.models.article')}は正常に更新されました." # トップページに戻る
    else
      render :new, status: :unprocessable_entity# updateのページに戻る
    end
  end

  def destroy
    @article.destroy
    redirect_to @article, notice: "#{t('activerecord.models.article')}は正常に削除されました." # トップページに戻る
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
