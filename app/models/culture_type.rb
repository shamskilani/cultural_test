# frozen_string_literal: true

# CultureType model
class CultureType < ApplicationRecord
  validates :name, presence: true
end
