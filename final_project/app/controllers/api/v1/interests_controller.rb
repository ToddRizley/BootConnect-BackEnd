module Api
  module V1
    class InterestsController < ApplicationController

      def create
        @interest = Interest.find_or_create_by(name: params["interest"])
        @user = User.includes(:interests).find_by(id: params["user_id"])
        @interest.users << @user
        @user.interests << @interest


        render json: @user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      def show
        interests = Interest.all.select { |interest|
          interest.users.find_by(id: params["id"])
        }
        updated_user = @interest.users.last
        render json: updated_user
      end

      def update
        user = User.find_by(id: params["userId"].to_i)
        user_interest = UserInterest.find_by(user_id: user.id, interest_id: params["id"].to_i)
        user_interest.destroy
        render json: user
      end

    end
  end
end
