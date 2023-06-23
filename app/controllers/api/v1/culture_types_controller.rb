module Api
    module V1
      class CultureTypesController < ApplicationController
        def create
          culture_type = CultureType.new(culture_type_params)
  
          if culture_type.save
            render json: culture_type, status: :created
          else
            render json: culture_type.errors, status: :unprocessable_entity
          end
        end
        def index
            culture_types = CultureType.all
            render json: culture_types
        end
        private
  
        def culture_type_params
          params.require(:culture_type).permit(:name)
        end
      end
    end
  end
