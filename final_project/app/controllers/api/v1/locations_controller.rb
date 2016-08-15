module Api
  module V1
    class LocationsController < ApplicationController

      def create
        @location=  Location.create(location_params)
        render json: @location
      end

      def index
        render json: Location.all, includes:['user', 'organization', 'job']
      end

      private

      def location_params
        params.require(:location).permit(:street, :city, :state, :zipcode)
      end
    end
  end
end
