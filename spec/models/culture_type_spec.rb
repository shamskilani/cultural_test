# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CultureType, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      culture_type = CultureType.new(name: nil)
      expect(culture_type).not_to be_valid
      expect(culture_type.errors[:name]).to include("can't be blank")
    end
  end
end
