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

	def area
		return calculate_area
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

class EquilateralTriangle < Triangle
#3, 3, 3


end

class IsoscelesTriangle < Triangle
#4, 3, 3


end

class ScaleneTriangle < Triangle
#3, 4, 5


end

test = EquilateralTriangle.new(3,4,5)
test.area