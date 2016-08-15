module Api
  module V1
    class JobsController < ApplicationController

      def create
        @job=  Job.create(job_params)
        render json: @job
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
