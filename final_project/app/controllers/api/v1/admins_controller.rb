module Api
  module V1
    class AdminsController < ApplicationController
      
        def create
          @admin =  Admin.create(admin_params)
          render json: @admin
        end

        def index
          render json: Admin.all, includes:['organization']
        end

        private

        def admin_params
          params.require(:admin).permit(:name, :email_address, :organization_id)
        end

    end
  end
end
