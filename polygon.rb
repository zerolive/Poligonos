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

	def perimeter
		return @sides.inject(:+)
	end

	def area
		#mirar el .to_i
		return calculate_area.to_i
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

	def is_equilateral
		return check_sides_are_equal
	end

	private

	def check_sides_are_equal
		 @sides.all? { |side_value| side_value == @sides[0]}
	end

end

class IsoscelesTriangle < Triangle

	def is_isosceles
		check_two_sides_equal
	end

	private

	def check_two_sides_equal
		if @sides.uniq.size == 2
			return true
		else
			return false
		end
	end

end

class ScaleneTriangle < Triangle

	def is_scalene
		check_hasnt_sides_equal
	end

	private

	def check_hasnt_sides_equal
		if @sides.uniq.size == 3
			return true
		else
			return false
		end
	end

end