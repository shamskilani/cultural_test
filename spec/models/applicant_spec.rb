# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'validations' do
    it 'validates presence of first_name' do
      applicant = Applicant.new(first_name: nil, last_name: 'Doe', culture_type: 'Type A')
      expect(applicant).not_to be_valid
      expect(applicant.errors[:first_name]).to include("can't be blank")
    end

    it 'validates presence of last_name' do
      applicant = Applicant.new(first_name: 'John', last_name: nil, culture_type: 'Type A')
      expect(applicant).not_to be_valid
      expect(applicant.errors[:last_name]).to include("can't be blank")
    end

    it 'validates presence of culture_type' do
      applicant = Applicant.new(first_name: 'John', last_name: 'Doe', culture_type: nil)
      expect(applicant).not_to be_valid
      expect(applicant.errors[:culture_type]).to include("can't be blank")
    end
  end

  describe 'attributes' do
    it 'has valid attributes' do
      applicant = Applicant.new(
        first_name: 'John',
        last_name: 'Doe',
        culture_type: 'Type A'
      )
      expect(applicant).to be_valid
      expect(applicant.first_name).to eq('John')
      expect(applicant.last_name).to eq('Doe')
      expect(applicant.culture_type).to eq('Type A')
    end
  end
end
