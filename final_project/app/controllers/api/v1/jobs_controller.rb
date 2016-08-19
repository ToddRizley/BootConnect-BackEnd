module Api
  module V1
    class JobsController < ApplicationController

      def create
        binding.pry
        job = Job.create({title: params["job"]["title"], description: params["job"]["description"], url: params["job"]["url"]})

        parsed_city = params["job"]["location"].split(',')[0]
        parsed_state = params["job"]["location"].split(',')[1]
        location = Location.where(:city => parsed_city, :state => parsed_state).first_or_create
        location.jobs << job

        user = User.find_by(id: params["user_id"].to_i)
        user.jobs << job
        user.save

        render json: user, include: ['interests', 'jobs', 'articles', 'organization', 'location']
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
