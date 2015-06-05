class lists < ActiveRecord::Migration
  def change
  	create_table "lists" |l|
  		l.integer "user_id"
  		l.string "list_name"
	  end
  end
end
