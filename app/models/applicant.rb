# frozen_string_literal: true

# Applicant model
class Applicant < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :culture_type, presence: true
end
