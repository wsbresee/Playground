data Tree a = Empty | Branch a (Tree a) (Tree a)
    deriving (Show, Eq)

hbalTree :: a -> Int -> [Tree a]
hbalTree _ 0 = [Empty]
hbalTree e 1 = [Branch e Empty Empty]
hbalTree e h = [Branch e left right | i     <- [h-1, h-2],
                                      j     <- [h-1, h-2],
                                      left  <- hbalTree e i,
                                      right <- hbalTree e j]

countNodes :: Tree a -> Int
countNodes Empty = 0
countNodes (Branch _ l r) = 1 + (countNodes l) + (countNodes r)

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

completeBinaryTree :: [a] -> Tree a
completeBinaryTree xs = cBT xs 0
    where
        cBT xs i
          | i > ((length xs) - 1) = Empty
          | otherwise       = (Branch (xs!!i) (cBT xs (2*i+1)) (cBT xs (2*i+2)))

isCompleteBinaryTree :: Tree a -> Bool
isCompleteBinaryTree t = treeEqual t $ completeBinaryTree $ take i [1..]
    where
        i = countNodes t
        treeEqual Empty Empty = True
        treeEqual Empty _     = False
        treeEqual _     Empty = False
        treeEqual (Branch _ l1 r1) (Branch _ l2 r2)
          = (treeEqual l1 l2) && (treeEqual r1 r2)

-- Problem 64

layout :: Tree a -> Tree (a, (Int, Int))
layout t = l' t 1 0
    where
        l' Empty _ _ = Empty
        l' (Branch x l r) i j
          = (Branch (x, (j', i)) (l' l (i+1) 0) (l' r (i+1) j'))
              where
                  j' = j + 1 + countNodes l

-- Problem 65

height :: Tree a -> Int
height Empty = 0
height (Branch _ l r) = maximum [height l, height r] + 1

layout2 :: Tree a -> Tree (a, (Int, Int))
layout2 t = lay2 t (2^((height t)-1)) 1
    where
        lay2 Empty x y = Empty
        lay2 (Branch elem l r) x y = (Branch (elem, (x, y)) l' r')
            where
                l' = lay2 l (x-((2^((height l)))`div`2)) (y+1)
                r' = lay2 r (x+((2^((height r)))`div`2)) (y+1)

-- Problem 66

fRight :: Tree (a, (Int, Int)) -> Int
fRight Empty = 0
fRight (Branch (n, (x, y)) l r) = maximum [0, fR x l, fR x r]
    where
        fR _ Empty = 0
        fR i (Branch (n, (x, y)) l r) = maximum [x - i, fR i l, fR i r]

fLeft :: Tree (a, (Int, Int)) -> Int
fLeft Empty = 0
fLeft (Branch (n, (x, y)) l r) = maximum [0, fL x l, fL x r]
    where
        fL _ Empty = 0
        fL i (Branch (n, (x, y)) l r) = maximum [i - x, fL i l, fL i r]

shiftT :: Int -> Tree (a, (Int, Int)) -> Tree (a, (Int, Int))
shiftT _ Empty = Empty
shiftT i (Branch (n, (x, y)) l r) = (Branch (n, (x+i,y)) l' r')
    where
        l' = (shiftT i l)
        r' = (shiftT i r)

layout3 :: Tree a -> Tree (a, (Int, Int))
layout3 t = lay3 t 1
    where
        lay3 Empty _ = Empty
        lay3 (Branch n l r) y = (Branch (n, (x, y)) l' r'')
            where
                l'  = lay3 l (y+1)
                r'  = lay3 r (y+1)
                x   = 1 + $ (fRight l') + (fLeft r')`div`2
                r'' = shiftT (x) r'

tree1 = Branch 'a' (Branch 'b' Empty Empty) (Branch 'c' Empty Empty)
tree2 = Branch 'n' (Branch 'k' (Branch 'c' (Branch 'a' Empty Empty) (Branch 'e' (Branch 'd' Empty Empty) (Branch 'g' Empty Empty) ) ) (Branch 'm' Empty Empty) ) (Branch 'u' (Branch 'p' Empty (Branch 'q' Empty Empty) ) Empty )
