module Api
    module V1
      class CompaniesController < ApplicationController
        def create
          company = Company.new(company_params)
  
          if company.save
            render json: company, status: :created
          else
            render json: company.errors, status: :unprocessable_entity
          end
        end

        def index
            companies = Company.all
            render json: companies
        end
  
        private
  
        def company_params
          params.require(:company).permit(:name, :city, :culture_type)
        end
      end
    end
  end
  