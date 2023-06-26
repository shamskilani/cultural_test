# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      company = Company.new(name: nil)
      expect(company).not_to be_valid
      expect(company.errors[:name]).to include("can't be blank")
    end
  end

  describe 'attributes' do
    it 'has valid attributes' do
      company = Company.new(name: 'ABC Company', culture_type: 'Type A')
      expect(company).to be_valid
      expect(company.name).to eq('ABC Company')
      expect(company.culture_type).to eq('Type A')
    end
  end
end
