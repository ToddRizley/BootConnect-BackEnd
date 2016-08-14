module Api
  module V1
    class AdminsController < ApplicationController
 
      def index
        render json: Admin.all
      end
    end
  end
end