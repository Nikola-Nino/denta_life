# frozen_string_literal: true

module Dashboard
  class ArticlesController < Dashboard::DashboardController
    def index
      @articles = current_user.articles
    end

    def new
      @article = Article.new
      authorize @article
    end

    def create
      @article = Article.new(article_params)
      authorize @article

      @article.user_id = current_user.id

      if @article.save
        redirect_to article_path(@article)
      else
        render :new
      end
    end

    def edit
      @article = Article.find(params[:id])
      authorize @article
    end

    def show
      @article = Article.find(params[:id])
      authorize @article
    end

    def update
      @article = Article.find(params[:id])
      authorize @article
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      @article = Article.find(params[:id])
      authorize @article
      @article.destroy

      redirect_to articles_path
    end

    private

    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
end
