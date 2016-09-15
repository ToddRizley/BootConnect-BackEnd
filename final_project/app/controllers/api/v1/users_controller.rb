require 'pry'
require 'bcrypt'
require 'jwt'
module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action  :verify_authenticity_token

      def create
        ##break out into model methods
        hmac_secret = "test_secret"
        payload = {name: params["user"]["fullName"], email_address: params["user"]["email"]}
        @user = User.create({
          name: params["user"]["fullName"],
          email_address: params["user"]["email"],
          token: JWT.encode(payload, hmac_secret, 'HS256')
          })
        @user.password = params["user"]["password"]
        @user.location = Location.where(:city => params["user"]["city"], :state => params["user"]["state"]).first_or_create
        @user.location.latitude = params["location_data"]["lat"].round(10)
        @user.location.longitude= params["location_data"]["lng"].round(10)
        @user.location.save
        @user.save
        render json: @user, include: ['token', 'interests', 'jobs', 'articles', 'organization', 'location']
      end

      def index
        render json: User.all, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end


      def show
        clean_email = params["email_address"].sub('&', '.')
        current_user = User.find_by(email_address: clean_email)

        render json: current_user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end

      ##move to service objects
      def filter_distance

        def distance(lat1, lon1, lat2, lon2)
           p = Math::PI/180
           a = 0.5 - Math.cos((lat2 - lat1) * p)/2 +
               Math.cos(lat1 * p) * Math.cos(lat2 * p) *
                   (1 - Math.cos((lon2 - lon1) * p))/2
           return 7917.5117 * Math.asin(Math.sqrt(a))
        end

        dist = params["distance"].to_i
        home = Location.find_by(city: params["home_city"])
        locs = Location.all.map do |loc|

          if (distance(home.latitude, home.longitude, loc.latitude, loc.longitude) <= dist)
            loc
          end
        end.compact

        users = locs.map do |l|
          if l.users
            l.users
          end
        end.flatten


        users.compact

        render json: users, include: ['interests', 'jobs', 'articles', 'organization', 'location']
      end




      def update
        user = User.find_by(id: params["id"].to_i)
        user.update_profile(params)
        user.save
        binding.pry
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
