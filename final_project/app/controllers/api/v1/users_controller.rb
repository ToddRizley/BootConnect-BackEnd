require 'pry'
module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action  :verify_authenticity_token

      def create
        @user = User.create({name: params["user"]["fullName"], email_address: params["user"]["email"] })
        @user.location = Location.where(:city => params["user"]["city"], :state => params["user"]["state"], :latitude => params["location_data"]["lat"], :longitude => params["location_data"]["lng"]).first_or_create
        @user.save
        render json: @user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      def index
        render json: User.all, include: ['location']
      end


      def show
        clean_email = params["email_address"].sub('&', '.')
        current_user = User.find_by(email_address: clean_email)
        ###DONT FORGET TO CHANGE THE &

        render json: current_user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      def update
        binding.pry
        @user = User.find_by(id: params["id"].to_i)

        #take in "city, state" string on Header Form
        #parse and create/find new location and associate the user

        #params = name, location, company, position
        @user.name = params["user"]["name"]
        @user.company = params["user"]["company"]
        @user.position = params["user"]["position"]

        parsed_city = params["user"]["location"].split(',')[0]
        parsed_state = params["user"]["location"].split(',')[1]

        @location = Location.find_or_create_by(city: parsed_city)
        @location.users << @user

        #user.update_profile(params)
        user.save
        render json: user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
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
