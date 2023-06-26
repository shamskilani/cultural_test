FactoryBot.define do
    factory :culture_type do
      sequence(:name) { |n| "Culture Type #{n}" }
    end
  end