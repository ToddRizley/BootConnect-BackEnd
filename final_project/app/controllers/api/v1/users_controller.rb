require 'pry'
module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.create(user_params)
        render json: @user
      end

      def index
        render json: User.all, includes:['interests', 'locations', 'articles', 'jobs', 'organization']
      end

      private

      def user_params(params)
        params.require(:user).permit(:name, :email_address, :zipcode, :organization_id)
      end
    end
  end
end
