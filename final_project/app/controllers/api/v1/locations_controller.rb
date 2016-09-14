module Api
  module V1
    class LocationsController < ApplicationController

      def create
        
        @location = Location.find_or_create_by(city: params["location"]["city"].capitalize!)
        @user = User.find_by(id: params["user_id"])
        @location.users << @user
        @location.save

        render json: @user
      end

      def show
        location = Location.find_by(city: params["id"])
        filtered = location.users

        render json: filtered, includes:['user', 'organization', 'jobs']
      end

      def index
        render json: Location.all, includes:['user']
      end



      private

      def location_params
        params.require(:location).permit(:city, :state)
      end
    end
  end
end
