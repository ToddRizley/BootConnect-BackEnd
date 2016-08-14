module Api
  module V1
    class OrganizationsController < ApplicationController
 
      def index
        render json: Organization.includes(:users), include: 
          ['users']
      end
    end
  end
end