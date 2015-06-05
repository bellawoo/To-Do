class todo_to_item < ActiveRecord::Migration
  def change
  	rename_table :todos, :items
  end
end
