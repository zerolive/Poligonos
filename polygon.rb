class Polygon
	def self.build *sides
		@sides = sides
		check_positive_sides
		return Triangle.build(*sides) if number_of_sides == 3
		return Quadrilateral.build(*sides) if number_of_sides == 4
	end

	def number_of_sides
		return @sides.count
	end

	def perimeter
		return @sides.inject(:+)
	end

	private

	def self.check_positive_sides 
		raise "Non-positive sides arent allowed" if there_are_negatives
	end
	def self.number_of_sides
		return @sides.count
	end
	def self.there_are_negatives
		@sides.any? { |side_value| side_value < 1 }
	end

end

class Triangle < Polygon
	def self.build *sides
		return EquilateralTriangle.new(*sides) if is_equilateral(*sides)
		return IsoscelesTriangle.new(*sides) if is_isosceles(*sides)
		return ScaleneTriangle.new(*sides) if is_scalene(*sides)
	end

	def initialize *sides
		@sides = *sides
		check_closed
	end

	def area
		return calculate_area
	end
	def equilateral?
		return false
	end
	def isosceles?
		return false
	end
	def scalene?
		return false
	end

	private 


	def calculate_area 
		semiperimeter = calculate_semiperimeter
		areatriangle = Math.sqrt(semiperimeter * (semiperimeter - @sides[0]) * (semiperimeter - @sides[1]) * (semiperimeter - @sides[2]))
		return areatriangle
	end

	def calculate_semiperimeter
		return @sides.inject(:+)/2
	end

	def check_closed
		raise "Short sides can't be shorter than long side or equal" if sum_of_every_side_is_longer_than_longer_side_twice
	end
	def sum_of_every_side_is_longer_than_longer_side_twice
		@sides.inject(:+) < @sides.max * 2
	end

	def self.is_equilateral *sides
		return check_sides_are_equal(*sides)
	end
	def self.is_isosceles *sides
		return check_two_sides_equal(*sides)
	end
	def self.is_scalene *sides
		return check_hasnt_sides_equal(*sides)
	end
	def self.check_sides_are_equal *sides
		sides.uniq.size == 1
	end
	def self.check_two_sides_equal *sides
		sides.uniq.size == 2
	end
	def self.check_hasnt_sides_equal *sides
		sides.uniq.size == 3
	end
	class EquilateralTriangle < Triangle

		def equilateral?
			return true
		end
	end

	class IsoscelesTriangle < Triangle

		def isosceles?
			return true
		end
	end

	class ScaleneTriangle < Triangle

		def scalene?
			return true
		end
		
	end
end

class Quadrilateral < Polygon
	def self.build *sides
		return Square.new(*sides) if is_square(*sides)
		return Rectangle.new(*sides) if is_rectangle(*sides)
		return Quadrilateral.new(*sides)
	end
	def initialize *sides
		@sides = sides	
	end

	def self.is_square *sides
		sides_are_equal(*sides)
	end
	def is_square
		return false
	end

	def self.is_rectangle *sides
		check_two_couples_of_equal_sides(*sides)
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
	def self.check_two_couples_of_equal_sides *sides
		@sides_to_count = sides
		@count = 0
		cheking_if_every_side_has_equal_sides
		return @count == 2
	end
	def self.cheking_if_every_side_has_equal_sides
		@sides_to_count.each_with_index do |a_side, a_index|
			check_if_a_side_its_equal_to_other_sides(a_side, a_index)
		end
	end
	def self.check_if_a_side_its_equal_to_other_sides (a_side, a_index)
		@sides_to_count.each_with_index do |b_side, b_index|
			checking_if_its_equal_a_side(a_side, b_side, a_index, b_index)
		end
	end
	def self.checking_if_its_equal_a_side (a_side, b_side, a_index, b_index)
		if a_side == b_side && a_index != b_index
			@count += 1
			@sides_to_count.delete(a_side)
		end
	end
	class Square < Quadrilateral
		def initialize *sides
			@sides = sides
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