module Api
  module V1
    class UsersController < ApplicationController
 
      def index
        render json: User.includes(:interests, :locations, :organizations), include: 
          ['interests', 'locations', 'organizations']
      end
    end
  end
end