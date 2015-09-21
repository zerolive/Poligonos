class Quadrilateral
	def self.build *sides
		return Square.new(*sides) if is_square(*sides)
		return Rectangle.new(*sides) if is_rectangle(*sides)
		return Quadrilateral.new(*sides)
	end
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

	def self.is_square *sides
		sides_are_equal(*sides)
	end
	def is_square
		return false
	end

	def self.is_rectangle *sides
		check_two_couples_sides_equal(*sides)
	end
	def is_rectangle
		return false
	end
	
	private

	def there_are_nonpositive_sides
		@sides.any? { |side_value| side_value < 1 }
	end

	def sum_of_sides
		@sides.inject(:+)
	end

	def self.sides_are_equal *sides
		sides.uniq.size == 1
	end
	def self.check_two_couples_sides_equal *sides
		count = 0
		sides_for_count = []
		sides.each { |side| sides_for_count << side }
		sides_for_count.each_with_index do |a_side, a_index|
			sides_for_count.each_with_index do |b_side, b_index|
				if a_side == b_side && a_index != b_index
					count += 1
					sides_for_count.delete(a_side)
				end
			end
		end
		return true if count == 2
		return false if count !=2
	end
	class Square < Quadrilateral
		def initialize *sides
			@sides = sides
			check_positive_sides
		end
		def area
			return calculate_area
		end
		def is_square
			return true
		end
		def is_rectangle
			return false
		end
		def is_trapezoid
			return false
		end

		private

		def calculate_area
			return @sides[0] * @sides[0]
		end
	end
	class Rectangle < Quadrilateral
		def initialize *sides
			@sides = sides
			check_positive_sides
		end
		def area
			return calculate_area
		end
		def is_square
			return false
		end
		def is_rectangle
			return true
		end
		def is_trapezoid
			return false
		end

		private

		def calculate_area
			return @sides.min * @sides.max
		end
	end
end

