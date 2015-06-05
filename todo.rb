require 'pry'

require './db/setup'
require './lib/all'

class List
	def add_item
		
	end

	def set_due_date
		
	end

	def done?
		
	end

	def view_incomplete_items
		
	end

	def view_single_list
		
	end

	def view_all_items
		
	end

	def next_item
		
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
			listicize.add_item ARGV.first, username
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