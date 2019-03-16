data Tree a = Empty | Branch a (Tree a) (Tree a)
    deriving (Show, Eq)

hbalTree :: a -> Int -> [Tree a]
hbalTree _ 0 = [Empty]
hbalTree e 1 = [Branch e Empty Empty]
hbalTree e h = [Branch e left right | i     <- [h-1, h-2],
                                      j     <- [h-1, h-2],
                                      left  <- hbalTree e i,
                                      right <- hbalTree e j]

-- Problem 61

countLeaves :: Tree a -> Int
countLeaves Empty = 0
countLeaves (Branch _ Empty Empty) = 1
countLeaves (Branch _ l r) = (countLeaves l) + (countLeaves r)

-- Problem 61A

leaves :: Tree a -> [Tree a]
leaves Empty = []
leaves (Branch x Empty Empty) = [Branch x Empty Empty]
leaves (Branch _ l r) = (leaves l) ++ (leaves r)

-- Problem 62

internals :: Tree a -> [Tree a]
internals Empty = []
internals (Branch x Empty Empty) = []
internals (Branch x l r) = (Branch x l r) : ((internals l) ++ (internals r))

-- Problem 62B

atLevel :: Tree a -> Int -> [Tree a]
atLevel Empty _ = []
atLevel (Branch x l r) h
  | h <  1      = error "Given level cannot be less than 1"
  | h == 1      = [Branch x l r]
  | otherwise   = (atLevel l (h-1)) ++ (atLevel r (h-1))

-- Problem 63
