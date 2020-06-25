class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :author_id
      t.integer :amount
      t.string :name

      t.timestamps
    end
  end
end
