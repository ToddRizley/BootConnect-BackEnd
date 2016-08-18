module Api
  module V1
    class JobsController < ApplicationController

      def create
        if Job.find_by(url: params["job"]["url"]) == true
          job =  Job.find_by(url: params["job"]["url"])
          user = User.find_by(id: params["user_id"])
          user.jobs << job
          user.save
        else
          job = Job.create(title: params["job"]["title"], description: params["job"]["description"],  url: params["job"]["url"])
          user = User.find_by(id: params["user_id"])
          user.jobs << article
          user.location.jobs << job
          user.save
        end

        render json: user
      end

      def index
        render json: Job.all, includes:['user', 'location']
      end

      private

      def job_params
        params.require(:job).permit(:title, :description, :url, :user_id, :location_id)
      end
    end
  end
end
