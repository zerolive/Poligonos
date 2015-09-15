class Polygon
  
end

class Triangle
	def initialize *sides
		@sides = *sides
		check_positive_sides
		check_closed
	end
	def number_of_sides 
		return @sides.count
	end

	def calculate_perimeter
		return @sides.inject(:+)
	end

	private

	def check_positive_sides 
		if there_are_negatives
				raise "Negative values not allowed"
			end
	end
	def check_closed
		if sum_of_every_side_is_longer_than_longer_side_twice
			raise "Short sides can't be shorter than long side or equal"
		end
	end
	def there_are_negatives
		@sides.any? { |side_value| side_value < 1 }
	end
	def sum_of_every_side_is_longer_than_longer_side_twice
		@sides.inject(:+) < @sides.max * 2
	end
end