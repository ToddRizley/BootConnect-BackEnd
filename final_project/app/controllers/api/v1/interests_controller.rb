module Api
  module V1
    class InterestsController < ApplicationController

      def create
        binding.pry
        if Interest.find_by(name: params["name"]) == true
          @interest = Interest.find_by(name: params["name"])
          @interest.users << User.find_by(id: params["user_id"])
          @interest.save
        else
          binding.pry
          @interest = Interest.create(name: params["name"], description: params["description"])
          @interest.users << User.find_by(id: params["user_id"])
          @interest.save
        end
        binding.pry
        render json: @interest
      end

      def index
        render json: Interest.all, includes:['user']
      end


    end
  end
end
