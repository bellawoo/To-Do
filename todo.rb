require 'pry'

require './db/setup'
require './lib/all'

class ToDoList
	def initialize
		puts "Hello! Please log-in by providing your username."
		user = gets.chomp
		puts "Thank you, #{user}. Select from the following commands."
	end

	def get_command
		puts "'add' to add a new to-do entry to a list"
		puts "'list' to show all incomplete items"
		puts "'list all' to show all to-do items from all lists"
		puts "'next' to show an incomplete item from one of your lists"
		puts "'mark complete' to check off an entry from your to-do list"
		puts "'change due date' on one of your to-do items"
		puts "'search' to look for an entry"
		command = gets.chomp.downcase

		case command
		when "add" #will also need to initialize setting the due date and creating a new list if needed
			username = `whoami`.chomp
			listicize.create_entry
		when "list"
			listicize.view_incomplete_items
		when "list [list_name]"
			listicize.view_single_list
		when "list all"
			listicize.view_all_items
		when "next"
			listicize.next_item
		when "mark complete"
			listicize.done?
		when "change due date"
			listicize.set_due_date
		when "search"
			listicize.search_for_item
		else
			puts "I don't know what #{command} means."
		end
	end

	def create_entry list_name, entry, due=nil, username
		user = User.where(name: name).first_or_create!
		user.items.create! list_id: list_name, item_name: entry, due: due, completed: false
	end

	def view_incomplete_items
		Item.where(completed: true)
	end

	def view_single_list list_name
		List.where(list_name: list_name)
	end

	def view_all_items
		List.all
	end

	def next_item
		
	end

	def set_due_date
		
	end

	def done?
		selected_item = #the item that the user wants to mark complete
		selected_item.mark_completed!
	end

	def search_for_item
		puts "Enter keyword to search"
		terms = gets.chomp
		Item.where('entry LIKE "terms"')
	end

	# def user_login
		
	# end
end

listicize = List.new
listicize.get_command

