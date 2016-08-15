module Api
  module V1
    class OrganizationsController < ApplicationController

      def create
        @organization=  Organization.create(organization_params)
        render json: @organization
      end

      def index
        render json: Organization.all, includes:['user', 'admin', 'location']
      end

      private

      def organization_params
        params.require(:organization).permit(:name)
      end

    end
  end
end
