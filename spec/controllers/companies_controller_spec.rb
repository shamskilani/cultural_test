# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { company: { name: 'Test Company', culture_type: 'Type A' } } }

      it 'creates a new company' do
        expect { post :create, params: valid_params }.to change(Company, :count).by(1)
      end

      it 'returns the created company as JSON' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { company: { name: '', culture_type: 'Type A' } } }

      it 'does not create a new company' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Company, :count)
      end

      it 'returns the errors as JSON' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'GET #index' do
    it 'returns all companies' do
      FactoryBot.create_list(:company, 3)
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(3)
    end
  end
end
