module Api
  module V1
    class InterestsController < ApplicationController
 
      def index
        render json: Interest.includes(:users), include: 
          ['users']
      end
    end
  end
end