# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::ApplicantsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          applicant: {
            first_name: 'John',
            last_name: 'Doe',
            culture_type: 'Type A'
          }
        }
      end
      it 'creates a new applicant' do
        expect do
          post :create, params: valid_params
        end.to change(Applicant, :count).by(1)
      end
      it 'returns HTTP status 201 (Created)' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
      it 'returns the created applicant as JSON' do
        post :create, params: valid_params
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include('first_name' => 'John', 'last_name' => 'Doe', 'culture_type' => 'Type A')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          applicant: {
            first_name: '',
            last_name: 'Doe',
            culture_type: 'Type A'
          }
        }
      end

      it 'does not create a new applicant' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Applicant, :count)
      end

      it 'returns HTTP status 422 (Unprocessable Entity)' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the errors as JSON' do
        post :create, params: invalid_params
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include('first_name' => ["can't be blank"])
      end
    end
  end

  describe 'GET #index' do
    it 'returns all applicants' do
      applicants = FactoryBot.create_list(:applicant, 3)
      get :index
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to eq(applicants.as_json)
    end
  end

  describe 'GET #matched' do
    it 'returns applicants with matching culture type' do
      FactoryBot.create(:applicant, culture_type: 'Type A')
      FactoryBot.create(:applicant, culture_type: 'Type B')
      get :matched, params: { culture_type: 'Type A' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expected_response = [{ 'culture_type' => 'Type A' }]
      parsed_response = JSON.parse(response.body)
      # Select only the necessary attributes for comparison
      filtered_response = parsed_response.map { |applicant| applicant.slice('culture_type') }
      expect(filtered_response).to eq(expected_response)
    end
  end
end
