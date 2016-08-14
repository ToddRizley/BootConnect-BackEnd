module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.includes(:interests, :locations, :articles, :jobs, :organization), include:
          ['interests', 'locations', 'articles', 'jobs', 'organization']
      end
    end
  end
end
