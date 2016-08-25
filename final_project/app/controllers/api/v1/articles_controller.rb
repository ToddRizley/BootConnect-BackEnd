module Api
  module V1
    class ArticlesController < ApplicationController

      def create
        article = Article.create(title: params["article"]["title"], url: params["article"]["url"])
        user = User.find_by(id: params["user_id"])
        user.articles << article
        user.save
        render json: user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      def index
        render json: Article.all, includes:['user']
      end

      def destroy
        id = params["id"]
        article = Article.find_by(id: id)
        article.destroy
        render json: Article.all, includes:['user']
      end

      private

      def article_params
        params.require(:article).permit(:title, :url, :user_id)
      end
    end
  end
end
