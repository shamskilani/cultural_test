class Company < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    attribute :culture_type
end
