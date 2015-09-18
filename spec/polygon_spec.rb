require './polygon'
require './quadrilaterals'
require 'rspec'

describe "A triangle" do


  it "Has three sides " do
  	expect(Triangle.build(1, 1, 1).number_of_sides).to be(3)
  end
  it "Has positive sides" do
  	expect{Triangle.build(0, 1, 1)}.to raise_error "Negative values not allowed"
  end
  it "Needs to be closed" do
  	expect{Triangle.build(3, 1, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.build(1, 3, 1)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.build(1, 1, 3)}.to raise_error "Short sides can't be shorter than long side or equal"
  	expect{Triangle.build(1, 1, 1)}.not_to raise_error
  end
  it "Knows its perimeter" do
  	expect(Triangle.build(1, 2, 2).perimeter).to be(5)
  	expect(Triangle.build(1, 1, 1).perimeter).to be(3)
  end
  it "Knows how to find area" do
  	expect(Triangle.build(3, 4, 5).area).to eq(6)
  end
  it "Knows if its equilateral" do
	expect(Triangle.build(3, 3, 3).equilateral?).to be(true) 
	expect(Triangle.build(3, 3, 4).equilateral?).to be(false)
	expect(Triangle.build(3, 4, 5).equilateral?).to be(false)
  end
  it "Knows if its isosceles" do
	expect(Triangle.build(3, 3, 3).isosceles?).to be(false)
	expect(Triangle.build(3, 4, 3).isosceles?).to be(true)
	expect(Triangle.build(3, 4, 5).isosceles?).to be(false)
  end
  it "Knows if its scalene" do
	expect(Triangle.build(3, 3, 3).scalene?).to be(false)
	expect(Triangle.build(3, 4, 3).scalene?).to be(false)
	expect(Triangle.build(3, 4, 5).scalene?).to be(true)
  end
end

describe "A Quadrilateral" do

	it "Has four sides" do
		expect(Quadrilateral.new(1,1,1,1).number_of_sides).to eq(4)
	end
	it "Has positive sides" do
		expect{Quadrilateral.new(0,1,1,1)}.to raise_error "Non-positive sides arent allowed"
	end
	it "Knows its perimeter" do
		expect(Quadrilateral.new(1,1,1,1).perimeter).to eq(4)
		expect(Quadrilateral.new(1,1,1,2).perimeter).to eq(5)
	end
	it "Knows if its a square" do
		expect(Quadrilateral.new(1,1,1,1).is_square).to be(true)
		expect(Quadrilateral.new(1,1,1,2).is_square).to be(false)
	end
end