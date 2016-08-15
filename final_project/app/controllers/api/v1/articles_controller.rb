module Api
  module V1
    class ArticlesController < ApplicationController

      def create
        @article =  Article.create(article_params)
        render json: @article
      end

      def index
        render json: Article.all, includes:['user']
      end

      private

      def article_params
        params.require(:article).permit(:title, :url, :user_id)
      end
    end
  end
end
