-- type Assoc k v  = [(k, v)]

-- phonebook:: Assoc String String
-- phonebook = [("Alice", "123-4567"), ("Bob", "987-6543"), ("Charlie", "555-1234")]

-- findValue :: Eq k => k -> Assoc k v -> Maybe v
-- findValue key [] = Nothing
-- findValue key ((k,v):xs)
--     | key == k  = Just v
--     | otherwise = findValue key xs

-- findValue_c :: Eq k => k -> Assoc k v -> v
-- findValue_c k t = head [v | (k', v) <- t, k == k']

-- --data
-- type Pos = (Int, Int)

-- data Move = Left_ | Right_ | Up_ | Down_ deriving (Show)

-- move_ :: Move -> Pos -> Pos
-- move_ Left_  (x, y) = (x - 1, y)
-- move_ Right_ (x, y) = (x + 1, y)
-- move_ Up_   (x, y) = (x, y - 1)
-- move_ Down_  (x, y) = (x, y + 1)

-- moves :: [Move] -> Pos -> Pos
-- moves [] p     = p
-- moves (m:ms) p = moves ms (move_ m p)

-- flip_ :: Move -> Move
-- flip_ Left_  = Right_
-- flip_ Right_ = Left_
-- flip_ Up_    = Down_
-- flip_ Down_  = Up_

-- --shape
-- data Shape = Circle Float
--            | Rectangle Float Float
--            | Treetangle Float Float
--            | Square Float
--            deriving Show

-- square :: Float -> Shape
-- square x = Rectangle x x

-- area :: Shape -> Float
-- area (Rectangle x y) = x * y
-- area (Circle r) = pi * r * r
-- area (Treetangle x y) = 0.5 * x * y
-- area (Square x) = x * x

-- --maybe
-- safediv		::	Int → Int → Maybe Int
-- safediv _ 0	=	Nothing
-- safediv m n	=	Just (m `div` n)

-- safehead		::	[a] → Maybe a
-- safehead []	=	Nothing
-- safehead xs	=	Just (head xs)

--map
-- myMap:: (a->a)->[a]->[a]
-- myMap _ [] = []
-- myMap f (x:xs) = f x : myMap f xs

-- myMap_c:: (a->a)->[a]->[a]
-- myMap_c _ [] = []
-- myMap_c f xs = [f x | x<-xs]
main::IO()
main =do
    -- let aliceNumber= findValue "Alice" phonebook
    -- print aliceNumber

    -- let aliceNumber2= findValue_c "Alice" phonebook
    -- print aliceNumber2

    -- let initialPos = (5, 3)
    -- let movesList = [Right_, Down_]
    -- let finalPos = moves movesList initialPos
    -- putStrLn $ "Final Position after moves: " ++ show finalPos

    -- let shape1 = Circle 5.0
    -- let shape2 = square 4.0
    -- let shape3 = Rectangle 3.0 4.0
    -- let shape4 = Treetangle 3.0 4.0
    -- let shape5 = Square 4.0

    -- print $ "Area of shape1 (Circle): " ++ show (area shape1)
    -- print $ "Area of shape2 (Square via Rectangle): " ++ show (area shape2)
    -- print $ "Area of shape3 (Rectangle): " ++ show (area shape3)
    -- print $ "Area of shape4 (Treetangle): " ++ show (area shape4)
    -- print $ "Area of shape5 (Square): " ++ show (area shape5)
    let result = myMap (+10) [1, 2 ..20]
    print result
    let result2 = myMap_c (+10) [1, 2 ..20]
    print result

