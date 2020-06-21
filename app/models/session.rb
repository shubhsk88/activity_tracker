class Session < ApplicationRecord
    belongs_to :author,class_name: "User"
    has_many :groupings
    has_many :groups,through: :groupings
    validates :amount ,presence:true,numericality: {only_float: true}
    validates :name,presence:true
end
