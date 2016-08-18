module Api
  module V1
    class LocationsController < ApplicationController

      def create
        binding.pry
        if Location.find_by(city: params["location"]["city"]) == true
          @location =  Location.find_by(city: params["location"]["city"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        else
          @location = Location.create(city: params["location"]["city"], state: params["location"]["state"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        render json: @location
        end
      end

      def index
        render json: Location.all, includes:['user', 'organization']
      end

      private

      def location_params
        params.require(:location).permit(:city, :state)
      end
    end
  end
end
