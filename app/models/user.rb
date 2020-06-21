class User < ApplicationRecord
   
    has_many :sessions,foreign_key: :author_id,dependent: :destroy

    validates :name, presence:true, format: { with:  /\A[a-zA-Z\s]+\z/,message:"Only letters are allowed"},length:{minimum: 3, maximum: 30}

    validates :username,presence:true,uniqueness:true,format: { with: /[a-zA-Z0-9]/},length:{minimum: 3, maximum: 10}
end
