class User < ApplicationRecord
    has_many :groups
    has_many :transactions, foreign_key: :author_id, dependent: :destroy
    validates :name,:username,presence:true
    validates :username,uniqueness:true
end
