# frozen_string_literal: true

FactoryBot.define do
    factory :applicant do
      first_name { "John" }
      last_name { "Doe" }
      culture_type { "Type A" }
    end
end