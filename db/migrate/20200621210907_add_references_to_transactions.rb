class AddReferencesToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :users, column: "author_id"
  end
end
