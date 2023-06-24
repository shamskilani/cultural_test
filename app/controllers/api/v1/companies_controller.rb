# frozen_string_literal: true

module Api
  module V1
    # Controller for managing companies
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
        params.require(:company).permit(:name, :culture_type)
      end
    end
  end
end
