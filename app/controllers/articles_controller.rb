class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @selected_category = Category.find(category_ids)

    respond_to do |format|
      if @article.save
        @article.categories <<  @selected_category 
        format.html { redirect_to category_path(@article.categories.first.id), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @selected_category = Category.find(category_ids)
    articles_categories = ArticlesCategory.all.where(article_id: @article.id)
    respond_to do |format|
      if @article.update(article_params)
        articles_categories.each do |a|
          a.destroy
        end
        @article.categories <<  @selected_category 
        format.html { redirect_to category_path(@article.categories.first.id), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    vote = Vote.all.where(article_id: @article.id)
    articles_categories = ArticlesCategory.all.where(article_id: @article.id)
    vote.each do |v|
      v.destroy
    end
    articles_categories.each do |a|
      a.destroy
    end
    @article.destroy
    respond_to do |format|
      format.html { redirect_to category_path(@article.categories.first.id), notice: "Article was successfully destroyed." }
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
      params.require(:article).permit(:title, :text, :image, :author_id)
    end

    def category_ids
      params[:selected_id]
    end
end
