# frozen_string_literal: true

# Company model
class Company < ApplicationRecord
  validates :name, presence: true
  attribute :culture_type
end
