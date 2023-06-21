class CultureType < ApplicationRecord
    validates :name,presence:true
    validates :lower_end,presence:true
    validates :upper_end,presence:true
end
