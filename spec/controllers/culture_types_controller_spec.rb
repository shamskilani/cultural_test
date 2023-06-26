# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CultureTypesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new culture type' do
        culture_type_params = FactoryBot.attributes_for(:culture_type)
        post :create, params: { culture_type: culture_type_params }

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['name']).to eq(culture_type_params[:name])
      end
    end

    context 'with invalid parameters' do
      it 'returns the errors as JSON' do
        culture_type_params = { name: '' }
        post :create, params: { culture_type: culture_type_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to have_key('name')
      end
    end
  end

  describe 'GET #index' do
    it 'returns all culture types' do
      culture_type1 = FactoryBot.create(:culture_type)
      culture_type2 = FactoryBot.create(:culture_type)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      culture_types = JSON.parse(response.body)
      expect(culture_types.size).to eq(2)
      expect(culture_types.map { |ct| ct['name'] }).to match_array([culture_type1.name, culture_type2.name])
    end
  end
end
