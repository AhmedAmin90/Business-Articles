class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :before_create, only: %i[create]
  before_action :before_update, only: %i[update]
  before_action :before_destory, only: %i[destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /articles/1 or /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles or /articles.json
  def create
    respond_to do |format|
      if @article.save
        @article.categories << @selected_category
        format.html do
          redirect_to category_path(@article.categories.first.id), notice: 'Article was successfully created.'
        end
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        @articles_categories.each(&:destroy)
        @article.categories << @selected_category
        format.html do
          redirect_to category_path(@article.categories.first.id), notice: 'Article was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @vote.each(&:destroy)
    @articles_categories.each(&:destroy)
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :author_id, category_ids: [])
  end

  def category_ids
    params[:selected_id]
  end

  def before_create
    @categories = Category.all
    @article = Article.new(article_params)
    @selected_category = Category.find(category_ids)
  end

  def before_update
    @selected_category = Category.find(category_ids)
    @articles_categories = ArticlesCategory.all.where(article_id: @article.id)
  end

  def before_destory
    @vote = Vote.all.where(article_id: @article.id)
    @articles_categories = ArticlesCategory.all.where(article_id: @article.id)
  end
end
