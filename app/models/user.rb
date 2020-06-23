class User < ApplicationRecord
   
    has_many :sessions,foreign_key: :author_id,dependent: :destroy
    has_many :groups,through: :sessions

    validates :name, presence:true, format: { with:  /\A[a-zA-Z\s]+\z/,message:"Only letters are allowed"},length:{minimum: 3, maximum: 30}
    validates :username,presence:true,uniqueness:true,format: { with: /[a-zA-Z0-9]/},length:{minimum: 3, maximum: 10}

    

    # scope :my_sessions, -> {sessions.includes(:groups).select{ |a| a.groups.any?}}

    # scope :my_external_sesions, ->{ sessions.includes(:groups).select{ |a| !a.groups.any?}}

    

    def to_param
        username
    end
    def my_sessions
        sessions.includes(:groups).select{ |a| a.groups.any?}
    end
    def my_external_sessions
        sessions.includes(:groups).select{ |a| !a.groups.any?}
    
    end

    def my_external_sessions_count
        my_external_sesions.sum(:amount)
    end

    def recent
        sessions.order(created_at: :desc).limit(5)
    end

    def recent_count
        recent.sum(:amount)
    end
end
