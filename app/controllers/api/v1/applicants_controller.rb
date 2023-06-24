# frozen_string_literal: true

module Api
  module V1
    # Controller for managing applicants
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

      def matched
        culture_type = params[:culture_type]
        matched_applicants = Applicant.where(culture_type: culture_type)
        render json: matched_applicants
      end

      private

      def applicant_params
        params.require(:applicant).permit(:first_name, :last_name, :culture_type)
      end
    end
  end
end
