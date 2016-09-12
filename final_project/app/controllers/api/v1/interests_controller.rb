module Api
  module V1
    class InterestsController < ApplicationController

      def create
        @interest = Interest.find_or_create_by(name: params["interest"]["name"])
        @user = User.find_by(id: params["user_id"])
        @interest.users << @user

        render json: @user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      def show
        interests = Interest.all.select { |interest|
          interest.users.find_by(id: params["id"])
        }
        updated_user = @interest.users.last
        render json: updated_user
      end
    end
  end
end
