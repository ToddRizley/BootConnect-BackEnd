module Api
  module V1
    class ArticlesController < ApplicationController

      def create
        if Article.find_by(url: params["article"]["url"]) == true
          article =  Article.find_by(url: params["article"]["url"])
          user = User.find_by(id: params["user_id"])
          user.articles << article
          user.save
        else
          article = Article.create(title: params["article"]["title"], url: params["article"]["url"], user_id: params["user_id"])
          user = User.find_by(id: params["user_id"])
          user.articles << article
          user.save
        end
        render json: user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
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
