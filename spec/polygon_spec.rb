require './polygon'
require 'rspec'

describe "A triangle" do


  it "Has three sides " do
  	expect(Triangle.new(1, 1, 1).number_of_sides).to be(3)
  end
  it "Has positive sides" do
  	expect{Triangle.new(0, 1, 1)}.to raise_error "Negative values not allowed"
  end
  it "Needs to be closed" do
  	expect{Triangle.new(3, 1, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.new(1, 3, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.new(1, 1, 3)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.new(1, 1, 1)}.not_to raise_error
  end
  it "Knows its perimeter" do
  	expect(Triangle.new(1, 2, 2).perimeter).to be(5)
  	expect(Triangle.new(1, 1, 1).perimeter).to be(3)
  end
  it "Knows how to find area" do
  	expect(Triangle.new(3, 4, 5).area).to be(6)
  end
  it "Is equilateral" do
	expect(Triangle.new(3, 3, 3).is_equilateral).to be(true) 
	expect(Triangle.new(3, 3, 4).is_equilateral).to be(false)
	expect(Triangle.new(3, 4, 5).is_equilateral).to be(false)
  end
	it "Is isosceles" do
		expect(Triangle.new(3, 3, 3).is_isosceles).to be(false)
		expect(Triangle.new(3, 4, 3).is_isosceles).to be(true)
		expect(Triangle.new(3, 4, 5).is_isosceles).to be(false)
	end
end

describe "A isosceles triangle" do

	it "Has two sides equal" do
		expect(IsoscelesTriangle.new(3, 3, 3).is_isosceles).to be(false)
		expect(IsoscelesTriangle.new(3, 4, 3).is_isosceles).to be(true)
		expect(IsoscelesTriangle.new(3, 4, 5).is_isosceles).to be(false)
	end

end

describe "A scalene triangle" do

	it "Has two sides equal" do
		expect(ScaleneTriangle.new(3, 3, 3).is_scalene).to be(false)
		expect(ScaleneTriangle.new(3, 4, 3).is_scalene).to be(false)
		expect(ScaleneTriangle.new(3, 4, 5).is_scalene).to be(true)
	end

end