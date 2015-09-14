class Polygon
  
end

class Triangle
	NUMBER_OF_SIDES = 3
	def initialize side_a, side_b, side_c
		@total_perimeter = side_a + side_b + side_c
	end
	def number_of_sides
		NUMBER_OF_SIDES
	end
	def perimeter
		@total_perimeter
	end
end