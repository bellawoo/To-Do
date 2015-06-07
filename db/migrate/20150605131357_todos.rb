class todos < ActiveRecord::Migration
  def change
  	create_table "todos" do |t|
  		t.string "item"
  		t.date "due_date"
  		t.boolean "completed"
  		t.integer "list_id"
  		t.integer "user_id"
	  end
  end
end
