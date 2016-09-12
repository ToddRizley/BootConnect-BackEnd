module Api
  module V1
    class JobsController < ApplicationController

      def create
        ##need service objects
        job = Job.create({title: params["job"]["title"], description: params["job"]["description"], url: params["job"]["url"]})
        parsed_city = params["job"]["location"].split(',')[0]
        parsed_state = params["job"]["location"].split(',')[1]

        if Location.find_by(city: parsed_city)
          location= Location.find_by(city: parsed_city)
        else
          location = Location.create(city: parsed_city, state: parsed_state)
        end

        location.jobs << job
        location.save

        user = User.find_by(id: params["user_id"].to_i)
        user.jobs << job
        user.save
        render json: job, include: ['user', 'location']
      end

      def show
        location = Location.find_by(city: params["id"])
        filtered = location.jobs
        render json: filtered, includes:['user', 'location']
      end

      def index
        render json: Job.all, includes:['user', 'location']
      end
      ##move to service object
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

        jobs = locs.map do |l|
          if l.jobs
            l.jobs
          end
        end.flatten

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
