class Polygon
  
end

class Triangle
	NUMBER_OF_SIDES = 3
	def initialize side_a, side_b, side_c
		check_positive(side_a, side_b, side_c)
		check_closed(side_a, side_b, side_c)
		@total_perimeter = side_a + side_b + side_c
	end
	def number_of_sides
		NUMBER_OF_SIDES
	end
	def perimeter
		@total_perimeter
	end

	private

	def check_positive side_a, side_b, side_c
		if side_a < 1 || side_b < 1 || side_c < 1
			raise "Negative values not allowed"
		end
	end
	def check_closed side_a, side_b, side_c
		if side_a >= side_b + side_c || side_b >= side_a + side_c || side_c >= side_a + side_b
			raise "Short sides can't be shorter than long side or equal"		
		end
	end
end

class BTriangle
	def initialize *sides
		@sides = *sides
		check_positive_sides(*sides)
		check_closed(*sides)
	end
	def number_of_sides 
		return @sides.count
	end

	def calculate_perimeter
		return @sides.inject(:+)
	end

	private 

	def check_positive_sides *sides
		sides.each do |side_value|
			if side_value < 1
				raise "Negative values not allowed"
			end
		end
	end
	def check_closed *sides
		if sides.inject(:+) < sides.max * 2
			raise "Short sides can't be shorter than long side or equal"
		end
	end
end

#b_triangle = BTriangle.new(1, 2, 3)
#b_triangle.number_of_sides