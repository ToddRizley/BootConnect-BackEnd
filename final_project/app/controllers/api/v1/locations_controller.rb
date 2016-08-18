module Api
  module V1
    class LocationsController < ApplicationController

      def create
        if Location.find_by(city: params["location"]["city"]) == true
          @location =  Location.find_by(city: params["location"]["city"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        else
          @location = Location.create(city: params["location"]["city"], state: params["location"]["state"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        end

        updated_user = @location.user.last
        render json: updated_user
      end

      def index
        render json: Location.all, includes:['user', 'organization', 'jobs']
      end

      private

      def location_params
        params.require(:location).permit(:city, :state)
      end
    end
  end
end
