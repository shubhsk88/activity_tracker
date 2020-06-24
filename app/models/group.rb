class Group < ApplicationRecord
    
    validates :name, presence: true,uniqueness:true, format: { with:  /\A[a-zA-Z\s]+\z/,message:"Only letters are allowed"},length:{minimum: 3, maximum: 30}
    
    has_many :groupings
    has_many :sessions,through: :groupings

    def to_param
        name
    end
end
