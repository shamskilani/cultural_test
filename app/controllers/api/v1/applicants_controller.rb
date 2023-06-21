module Api
    module V1
      class ApplicantsController < ApplicationController
        def create
          applicant = Applicant.new(applicant_params)
  
          if applicant.save
            render json: applicant, status: :created
          else
            render json: applicant.errors, status: :unprocessable_entity
          end
        end

        def index
            applicants = Applicant.all
            render json: applicants
        end
  
        private
  
        def applicant_params
          params.require(:applicant).permit(:first_name, :last_name, :culture_type)
        end
      end
    end
  end
  
