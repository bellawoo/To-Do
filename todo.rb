require 'pry'

require './db/setup'
require './lib/all'

class List
	def create_entry entry, due=nil, username
		user = User.where(name: username).first_or_create!
		user.items.create! item_name: entry, due: due, completed: false
	end

	def view_incomplete_items
		List.where(completed: true)
	end

	def view_single_list
		
	end

	def view_all_items
		List.all
	end

	def next_item
		
	end

	def done?
		selected_item = #the item that the user wants to mark complete
		selected_item.mark_completed!
	end

	def search_for_item
		
	end

	# def user_login
		
	# end
end

listicize = List.new
command = ARGV.shift

case command
		when "add" #will also need to initialize setting the due date and creating a new list if needed
			username = `whoami`.chomp
			listicize.create_entry item_name, due, ARGV[2], username
		when "list"
			listicize.view_incomplete_items
		when "list [list_name]"
			listicize.view_single_list
		when "list all"
			listicize.view_all_items
		when "next"
			listicize.next_item
		when "done"
			listicize.done?
		when "change due date"
			listicize.set_due_date
		when "search"
			listicize.search_for_item
end