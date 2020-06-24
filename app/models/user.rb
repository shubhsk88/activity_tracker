class User < ApplicationRecord
   
    has_many :sessions,foreign_key: :author_id,dependent: :destroy
    has_many :groups,through: :sessions

    validates :name, presence:true, format: { with:  /\A[a-zA-Z\s]+\z/,message:"Only letters are allowed"},length:{minimum: 3, maximum: 30}
    validates :username,presence:true,uniqueness:true,format: { with: /[a-zA-Z0-9]/},length:{minimum: 3, maximum: 10}

    


    

    def to_param
        username
    end
    def my_sessions
        sessions.includes(:groups).select{ |a| a.groups.any?}
    end

    def my_sessions_count
        sessions.select('session.id, group.id').joins(:groups).sum(:amount)
      end
    def my_external_sessions
        sessions.includes(:groups).select{ |a| !a.groups.any?}
    
    end

    def my_external_sessions_count
        sessions.left_outer_joins(:groupings).where(groupings: { session_id: nil }).sum(:amount)
    end



    def top_activities
        sessions.order(amount: :desc).limit(5)
    end

    def top_activities_count
        top_activities.sum(:amount)
    end
end
