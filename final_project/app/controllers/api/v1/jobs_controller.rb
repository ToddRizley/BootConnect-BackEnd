module Api
  module V1
    class JobsController < ApplicationController
 
      def index
        render json: Job.all 
      end
    end
  end
end