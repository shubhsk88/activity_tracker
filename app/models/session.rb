class Session < ApplicationRecord
    belongs_to :author,class_name: "User"
    has_many :groupings
    has_many :groups,through: :groupings
end
