module Api
  module V1
    class ArticlesController < ApplicationController

      def create
        article = Article.create(title: params["article"]["title"], url: params["article"]["url"])
        render json: article
      end

      def index
        render json: Article.all
      end

      def destroy
        id = params["id"]
        article = Article.find_by(id: id)
        article.destroy
      end

      private

      def article_params
        params.require(:article).permit(:title, :url)
      end
    end
  end
end
