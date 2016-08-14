module Api
  module V1
    class LocationsController < ApplicationController
 
      def index
        render json: Location.includes(:users), include: 
          ['users']
      end
    end
  end
end