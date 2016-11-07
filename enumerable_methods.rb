module Enumerable  
  def my_each
  	for i in 0..length - 1 do
  		yield(self[i])
  	end
  	return self
  end 

  def my_each_with_index
    for i in 0..length - 1 do
  	  yield(self[i],i) 
  	end
  end

  def my_select
  	new_array = []
    for i in 0..length - 1 do
      if yield(self[i])
      	new_array.push(self[i])
      end
    end
    print new_array
  end

  def my_all?
  	bool = true
    for i in 0..length - 1 do
      if yield(self[i])
      	bool = true
      else
      	bool = false
      	break
      end
    end
    puts bool
  end

  def my_any?
  	bool = false
  	for i in 0..length-1 do
  	  if yield(self[i])
  	  	bool = true
  	  	break
  	  end
  	end
  	puts bool
  end

  def my_none?
  	bool = true
    for i in 0..length-1 do
      if yield(self[i])
      	bool = false
      	break
      end
    end
    puts bool
  end

  def my_count
    count = 0
    if block_given?
    	for i in 0..length-1 do
    		if yield(self[i])
    		count += 1
    		end
    	end
    else
    	count = self.length
    end
    puts count
  end

  def my_map(&proc)
  	new_array = []
  	for i in 0..length-1
  		new_array.push(yield(self[i]))
  	end
  	print new_array
  end

  def my_inject(i=nil)
    if i == nil
      result = self[0]
      for j in 1..length-1
    	result = yield(result,self[j])
      end
	else
	  result = i
	  for j in 0..length-1
	  	result = yield(result,self[j])
	  end
	end
    puts result
  end
end

def multiply_els(array)
    array.my_inject {|product, num| product * num}
end

multiply_by_3 = Proc.new {|i| i*3}

=begin
The following function calls were used for testing:
[6,2,6,1,7,4,2].my_each {|i| puts i*3}
[6,2,6,1,7,4,2].my_each_with_index {|i,index| puts "#{index}: #{i*3}"}
[6,7,5,1,9,4,6,2,3].my_select {|num| num.even? }
[8,6,2,10,12].my_all? {|i| i.even?}
[1,9,7,5,11].my_any? {|i| i.even?}
[1,9,7,5,10].my_none? {|i| i.even?}
[6,7,1,4,7,12,5].my_count {|i| i.even?}
["these","are","strings"].my_map {|i| i.to_s + "boo"}
["This","is","a","full","sentence"].my_inject("Hello,") {|sentence,word| sentence + " " + word}
multiply_els([6,7,3,5,2,1])
[5,1,7,4,1,3,9,0].my_map(&multiply_by_3)
=end
