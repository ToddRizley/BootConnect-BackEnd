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


      def show
        clean_email = params["email_address"].sub('&', '.')
        current_user = User.find_by(email_address: clean_email)
        ###DONT FORGET TO CHANGE THE &
        render json: current_user
      end

      private

      def user_params(params)
        params.require(:user).permit(:name, :email_address, :zipcode, :organization_id)
      end

      def email_params(params)
        params.require(:email_address)
      end
    end
  end
end
