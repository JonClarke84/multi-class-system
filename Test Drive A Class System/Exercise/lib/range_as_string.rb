def range_as_string(first, second)
  (first.to_s..second.to_s).to_a.join(" ")  
end

range_as_string(1, 10)