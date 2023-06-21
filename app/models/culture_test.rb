class CultureTest < ApplicationRecord
    validates :test_type, presence: true
    validates :respondent_id, presence: true
    validates :answer_one, presence: true
    validates :answer_two, presence: true
    validates :answer_three, presence: true
    validates :answer_four, presence: true
    validates :answer_five, presence: true
    validates :answer_six, presence: true
    validates :answer_seven, presence: true
    validates :answer_eight, presence: true
    validates :result, presence: true
    validates :completed_at, presence: true
end
