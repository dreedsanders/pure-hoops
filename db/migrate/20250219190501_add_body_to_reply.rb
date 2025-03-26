class AddBodyToReply < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :body, :string
  end
end
