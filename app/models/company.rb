class Company < ApplicationRecord
    validates :name, presence: true
    attribute :culture_type
end
