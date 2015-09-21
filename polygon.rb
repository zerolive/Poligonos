class Polygon
  
end

class Triangle
	def self.build *sides
		return EquilateralTriangle.new(*sides) if is_equilateral(*sides)
		return IsoscelesTriangle.new(*sides) if is_isosceles(*sides)
		return ScaleneTriangle.new(*sides) if is_scalene(*sides)
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

	def check_positive_sides 
		raise "Negative values not allowed" if there_are_negatives
	end
	def check_closed
		raise "Short sides can't be shorter than long side or equal" if sum_of_every_side_is_longer_than_longer_side_twice
	end
	def there_are_negatives
		@sides.any? { |side_value| side_value < 1 }
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