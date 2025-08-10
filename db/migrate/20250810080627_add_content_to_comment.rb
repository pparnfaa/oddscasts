class AddContentToComment < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :content, null: false, foreign_key: true
  end
end
