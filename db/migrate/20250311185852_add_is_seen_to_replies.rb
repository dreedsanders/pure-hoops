class AddIsSeenToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :is_seen, :boolean
  end
end
