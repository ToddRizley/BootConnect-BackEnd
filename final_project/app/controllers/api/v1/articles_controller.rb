module Api
  module V1
    class ArticlesController < ApplicationController
 
      def index
        render json: Articles.all
      end
    end
  end
end
