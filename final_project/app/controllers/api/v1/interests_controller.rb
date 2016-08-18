module Api
  module V1
    class InterestsController < ApplicationController

      def create
        ##replace with find_or_create_by
        if Interest.find_by(name: params["interest"]["name"]) == true
          @interest = Interest.find_by(name: params["interest"]["name"])
          @interest.users << User.find_by(id: params["user_id"])
          @interest.save
        else
          @interest = Interest.create(name: params["interest"]["name"], description: params["interest"]["description"])
          @interest.users << User.find_by(id: params["user_id"])
          @interest.save
        end
        render json: @interest
      end



      def show

        interests = Interest.all.select { |interest|
          interest.users.find_by(id: params["id"])
        }
        render json: interests, includes:['user']
      end


    end
  end
end
