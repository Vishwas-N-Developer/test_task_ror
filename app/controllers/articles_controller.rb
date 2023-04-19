class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.where(published: true)
  end

  def my_articles
    @articles = current_user.articles.all
  end

  def show
    @comments = @article.comments.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def publish
    @article = Article.find(params[:id])
    @article.update(published: true)
    redirect_to articles_url, notice: 'Article was successfully published.'
  end

  def hide
    @article = Article.find(params[:id])
    @article.update(published: false)
    redirect_to articles_url, notice: 'Article was successfully hidden.'
  end

  def search
    query = params[:search_articles].presence && params[:search_articles][:query]

    if query
      @articles = Article.search_published(query)
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, :cover,  :category_id,  :published, tag_ids: [])
    end
end
