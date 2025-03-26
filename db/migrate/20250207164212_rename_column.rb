class RenameColumn < ActiveRecord::Migration[6.1]
    def change
    change_table :action_cards do |t|
      t.rename :type, :action
    end
  end
end
