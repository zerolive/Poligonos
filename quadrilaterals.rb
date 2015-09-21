class Quadrilateral

	def initialize *sides
		@sides = sides
		check_positive_sides
	end
	def number_of_sides
		return @sides.count
	end
	def check_positive_sides
		raise "Non-positive sides arent allowed" if there_are_nonpositive_sides
	end

	def perimeter
		return sum_of_sides
	end

	def is_square
		sides_are_equal
	end

	def is_trapezoid
		sides_are_different
	end

	def is_rectangle
		count_number_of_equal_sides == 2
	end

	def print_values
		@sides.each { |x| p x }
	end

	#----------------------------------------------------------
	private

	def there_are_nonpositive_sides
		@sides.any? { |side_value| side_value < 1 }
	end

	def sum_of_sides
		@sides.inject(:+)
	end

	def sides_are_equal
		@sides.uniq.size == 1
	end
	def sides_are_different
		@sides.uniq.size == 4
	end
	def count_number_of_equal_sides
		count = 0
		sides_for_count = []
		@sides.each { |side| sides_for_count << side }
		sides_for_count.each_with_index do |a_side, a_index|
			sides_for_count.each_with_index do |b_side, b_index|
				if a_side == b_side && a_index != b_index
					count += 1
					sides_for_count.delete(a_side)
				end
			end
		end
		return count
	end
end