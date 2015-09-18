class Square 

	def initialize *sides
		@sides = sides
		check_positive_sides
	end
	def number_of_sides
		return @sides.count
	end
	def check_positive_sides
		if there_are_nonpositive_sides
			raise "Non-positive sides arent allowed" 	
		end 
	end

	def perimeter
		return sum_of_sides
	end

	private

	def there_are_nonpositive_sides
		@sides.any? { |side_value| side_value < 1 }
	end

	def sum_of_sides
		return @sides.inject(:+)
	end

end