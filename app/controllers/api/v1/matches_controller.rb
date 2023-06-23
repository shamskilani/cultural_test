class Api::MatchesController < ApplicationController
    def index
        company = Company.find(params[:company_id])
        matched_applicants = company.matches.map(&:applicant)
    
        render json: matched_applicants
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Company not found' }, status: :not_found
      end
end
