
numlis :: (Num a, Ord a) => a -> [a] -> a
numlis i [] = 0
numlis i (x:[]) = 1
numlis i (x1:x2:xs)
  | x1 >= x2 = max i (numlis 1 (x2:xs))
  | otherwise = numlis (1 + i) (x2:xs)

longestIntegerSubsequence xs = reverseList $ lis xs []
    where
        reverseList (x:xs) = reverse xs ++ [x]

lis :: (Num a, Ord a) => [a] -> [a] -> [a]
lis [] xs' = xs'
lis (x:xs) [] = lis xs [x]
lis (x:xs) (x':xs')
  | x > x'    = lis xs (x:x':xs')
  | otherwise = longest (lis xs [x]) (x':xs')
  where
      longest xs1 xs2
        | (length xs1) < (length xs2) = xs2
        | otherwise                   = xs1
