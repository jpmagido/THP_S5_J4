class AddCommentToGossips < ActiveRecord::Migration[5.2]
  def change
  	add_column :gossips, :comment, :text
  end
end
