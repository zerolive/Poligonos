require './polygon'
require 'rspec'

describe "A triangle" do


  it "It has three sides " do
  	a_triangle = Triangle.new(1, 1, 1)
  	expect(a_triangle.number_of_sides).to be(3)
  end

  it "Knows its perimeter" do
  	expect(Triangle.new(1, 1, 1).perimeter).to be(3)
  	expect(Triangle.new(1, 2, 1).perimeter).to be(4)
  end
end