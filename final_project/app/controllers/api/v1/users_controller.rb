require 'pry'
module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action  :verify_authenticity_token

      def create
        binding.pry
        @user = User.create({name: params["user"]["fullName"], email_address: params["user"]["email"] })
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

      def update
        user = User.find_by(id: params["id"].to_i)
        user.update_profile(params)
        user.save
        render json: user
      end

      private

      def user_params(params)
        params.require(:user).permit(:name, :email_address, :organization_id, :location_id)
      end

      def email_params(params)
        params.require(:email_address)
      end
    end
  end
end
