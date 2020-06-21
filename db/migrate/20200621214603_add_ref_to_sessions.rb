class AddRefToSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :user, column: :author_id
  end
end
