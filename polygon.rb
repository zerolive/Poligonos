class Polygon
  
end

class Triangle
	def self.build *sides
		new(*sides)
		if sides.uniq.size == 1; return EquilateralTriangle.new(*sides) end
		if sides.uniq.size == 2; return IsoscelesTriangle.new(*sides) end
		if sides.uniq.size == 3; return ScaleneTriangle.new(*sides) end
	end

	def initialize *sides
		@sides = *sides
		check_positive_sides
		check_closed
	end

	def number_of_sides
		return @sides.count
	end

	def perimeter
		return @sides.inject(:+)
	end

	def area
		return calculate_area
	end

	def is_equilateral
		return check_sides_are_equal
	end

	def is_isosceles
		return check_two_sides_equal
	end

	def is_scalene
		return check_hasnt_sides_equal
	end

	#private_class_method :new

	private 


	def calculate_area 
		semiperimeter = calculate_semiperimeter
		areatriangle = Math.sqrt(semiperimeter * (semiperimeter - @sides[0]) * (semiperimeter - @sides[1]) * (semiperimeter - @sides[2]))
		return areatriangle
	end

	def calculate_semiperimeter
		return @sides.inject(:+)/2
	end

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

	def check_sides_are_equal
		@sides.uniq.size == 1
	end

	def check_two_sides_equal
		@sides.uniq.size == 2
	end

	def check_hasnt_sides_equal
		@sides.uniq.size == 3
	end
end

class EquilateralTriangle < Triangle

end

class IsoscelesTriangle < Triangle

end

class ScaleneTriangle < Triangle

end