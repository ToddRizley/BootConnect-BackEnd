module Api
  module V1
    class InterestsController < ApplicationController

      def create
        @interest =  Interest.create(interest_params)
        render json: @interest
      end

      def index
        render json: Interest.all, includes:['user', 'location']
      end

      private

      def interest_params
        params.require(:interest).permit(:name, :description, :user_id, :location_id)
      end

    end
  end
end
