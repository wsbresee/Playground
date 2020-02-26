interview :: [Double] -> Bool
interview xs = compareToSum xs 0 $ getSum xs

getSum :: [Double] -> Double
getSum [] = 0
getSum (x:xs) = x + getSum xs

compareToSum :: [Double] -> Double -> Double -> Bool
compareToSum [] _ _ = False
compareToSum (x:xs) i s
  | (x + i) > (s / 2)  = False
  | (x + i) == (s / 2) = True
  | otherwise          = compareToSum xs (x + i) s

theArray = [100.0, 2.0, 2.0, 100.0]
