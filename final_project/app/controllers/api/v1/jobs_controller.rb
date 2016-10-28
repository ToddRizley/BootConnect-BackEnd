module Api
  module V1
    class JobsController < ApplicationController

      def create
        ##need service objects
        
        job = Job.create({title: params["job"]["values"]["title"], company: params["job"]["values"]["company"], url: params["job"]["values"]["url"]})
        parsed_city = params["job"]["values"]["location"].split(',')[0]
        parsed_state = params["job"]["values"]["location"].split(',')[1]
        loc = Location.find_by(city: parsed_city)

        if loc
          location= loc
        else
          location = Location.create(city: parsed_city, state: parsed_state, latitude: params["coords"]["lat"], longitude: params["coords"]["lng"] )
        end

        location.jobs << job
        location.save
        jobs = Job.all.includes(:location, :user)
        render json: jobs, include: ['user', 'location']
      end

      def show
        location = Location.find_by(city: params["id"])
        filtered = location.jobs
        render json: filtered, includes:['user', 'location']
      end

      def index
        jobs = Job.all.includes(:location, :user)
        render json: jobs, includes:['user', 'location']
      end
      ##move to service object
      def filter_distance
        dist = params["distance"].to_i
        home = Location.find_by(city: params["home_city"])
        locs = Services::DistanceCalculator.new.find_locations_in_radius(home, dist)
        jobs = Services::DistanceCalculator.new.find_closest_jobs(locs)
        jobs.compact

        render json: jobs, include: ['user', 'location']
      end

      def destroy
        id = params["id"]
        job = Job.find_by(id: id)
        job.destroy
        render json: user, includes:['user', 'location']
      end

      private

      def job_params
        params.require(:job).permit(:title, :description, :url, :user_id, :location_id)
      end
    end
  end
end
