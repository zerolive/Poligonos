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

describe "B triangle" do

	it "Has three sides " do
		b_triangle = BTriangle.new(1, 1, 1)
		expect(b_triangle.number_of_sides).to be(3)
	end
	it "Has positive sides" do
		expect{BTriangle.new(0, 1, 1)}.to raise_error "Negative values not allowed"
	end
	it "Needs to be closed" do
	  	expect{BTriangle.new(3, 1, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
	  	expect{BTriangle.new(1, 3, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
	  	expect{BTriangle.new(1, 1, 3)}.to raise_error "Short sides can't be shorter than long side or equal"
	  	expect{BTriangle.new(1, 1, 1)}.not_to raise_error
  	end
  	it "Knows its perimeter" do
	  	expect(BTriangle.new(1, 1, 1).calculate_perimeter).to be(3)
	  	expect(BTriangle.new(1, 2, 2).calculate_perimeter).to be(5)
  	end
end