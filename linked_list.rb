class LinkedList
	def initialize(value=nil, next_item=nil)
		@head = Node.new(value, next_item)
		@tail = @head
	end
	
	def append(value)
		if (@head.value == nil)
			@head = Node.new(value)
			@tail = @head
		else
			here = @head
			while (here.next_item != nil)
				here = here.next_item
			end
			
			here.next_item = Node.new(value)
			@tail = here.next_item
		end
	end
	
	def prepend(value)
		if (@head.value == nil)
			@head = Node.new(value)
		else
			head_temp = @head
			@head = Node.new(value)
			@head.next_item = head_temp
		end
	end
	
	def to_s
		show = ""
		here = @head
		while (here != nil)
			show += "(#{here.value}) -> "
			here = here.next_item
		end
		
		show += "nil"
		
		return show
	end
	
	def size
		Node.size
	end
	
	def head
		@head.value
	end
	
	def tail
		@tail.value
	end
	
	def pop
		tailVal = @tail.value
		here = @head

		while (here.next_item != @tail)
			here = here.next_item
		end
		
		here.next_item = nil
		@tail = here
		
		Node.size_reduced
		tailVal
	end
	
	def contains?(val)
		here = @head
		while (here != nil)
			if (here.value == val)
				return true
			end

			here = here.next_item
		end
		
		false
	end
	
	def at(index)
		here = @head
		i = 0
		
		while (here != nil)
			if (i == index)
				return here.value
			end
			i += 1
			here = here.next_item
		end
		
		nil
	end
	
	def find(data)
		here = @head
		i = 0
		
		while (here != nil)
			if (here.value == data)
				return i
			end
			i += 1
			here = here.next_item
		end
		
		nil
	end
	
	def insert_at(value, index)
		here = @head
		i = 0
		b = false
		
		while (here != nil)
			if (i + 1 == index)
				prevnode = here
			end
			if (i == index)
				nextnode = here
				here = Node.new(value, nextnode)
				prevnode.next_item = here
				b = true
				break
			end
			i += 1
			here = here.next_item
		end
		
		if (!b)
			@tail = Node.new(value, nil)
			begin
				prevnode.next_item = @tail
				nil
			rescue
				puts "Index out of range"
			end
		end
	end
	
	def remove_at(index)
		here = @head
		i = 0
		b = false
		
		while (here != nil)
			if (i + 1 == index)
				prevnode = here
			end
			if (i == index)
				prevnode.next_item = here.next_item
				b = true
				break
			end
			
			i += 1
			here = here.next_item
		end
		
		if (!b)
			"Index out of range"
		end
	end
end

class Node
	attr_accessor :value, :next_item
	
	@@number_of_nodes = 0
	
	def initialize(value, next_item=nil)
		@value = value
		@next_item = next_item
		@@number_of_nodes += 1
	end
	
	def self.size
		@@number_of_nodes - 2
	end
	
	def self.size_reduced
		@@number_of_nodes -= 1
	end
end

=begin LinkedList implementation tests
l = LinkedList.new
l.append(23)
l.append(35)
l.append(39)
l.prepend(17)
l.prepend(20)
l.append(45)
puts l
puts "List size: #{l.size}"
puts "List head: #{l.head}"
puts "List tail: #{l.tail}"
puts "Popped: #{l.pop}"
puts "Popped: #{l.pop}"
puts "Popped: #{l.pop}"
puts l
puts "List size: #{l.size}"
puts "List contains 25? #{l.contains?(25)}"
puts "List contains 17? #{l.contains?(17)}"
puts "List item at index 2? #{l.at(2)}"
puts "At what index is number 17? #{l.find(17)}"
puts "Insert 250 at index 3 #{l.insert_at(250, 3)}"
puts l
puts "Insert 4343 at index 1 #{l.insert_at(4343, 1)}"
puts l
puts "Remove element at index 3 #{l.remove_at(3)}"
puts l
puts "Remove element at index 1 #{l.remove_at(1)}"
puts l
puts "Remove element at index 5: #{l.remove_at(5)}"
=end