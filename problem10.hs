
getMultiples = foldl (\ acc x -> if x `mod` 3 == 0 || x `mod` 5 == 0 then acc + x else acc) 0 [1..10000]

