module Api
    module V1
      class CultureTestsController < ApplicationController
        def create
          culture_test = CultureTest.new(culture_test_params)
  
          if culture_test.save
            render json: culture_test, status: :created
          else
            render json: culture_test.errors, status: :unprocessable_entity
          end
        end
  
        private
  
        def culture_test_params
          params.require(:culture_test).permit(:test_type, :respondent_id, :answer_one, :answer_two, :answer_three, :answer_four, :answer_five, :answer_six, :answer_seven, :answer_eight, :result, :created_at, :completed_at)
        end
      end
    end
  end
  