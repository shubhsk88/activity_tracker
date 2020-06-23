class Group < ApplicationRecord
    
    validates :name, presence: true,uniqueness:true, format: { with:  /\A[a-zA-Z\s]+\z/,message:"Only letters are allowed"},length:{minimum: 3, maximum: 30}
    validates :icon, format: { with: /.+\.(jpe?g|png)\z/,message: 'only allows Jpeg,jpg formats are allowed' },allow_blank: true
    has_many :groupings
    has_many :sessions,through: :groupings
end
