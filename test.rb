a = [2,2,3]
p a.inject(:+) 
p a.max
if a.inject(:+) > a.max * 2
	p "hi"
end