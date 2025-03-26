class CreateActionCards < ActiveRecord::Migration[6.1]
  def change
    create_table :action_cards do |t|
      t.string :title
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
