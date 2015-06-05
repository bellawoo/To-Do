class users < ActiveRecord::Migration
  def change
  	create_table "users" |u|
  		u.string "name"
	  end
  end
end
