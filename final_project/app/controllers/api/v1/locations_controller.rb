module Api
  module V1
    class LocationsController < ApplicationController

      def create

        if Location.find_by(city: params["city"]) == true
          @location =  Location.find_by(city: params["city"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        else
          @location = Location.create(city: params["city"], state: params["state"])
          @location.users << User.find_by(id: params["user_id"])
          @location.save
        end
        binding.pry
        updated_user = @location.users.last
        render json:updated_user
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
