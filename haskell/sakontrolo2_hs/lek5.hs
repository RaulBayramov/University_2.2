-- Eq sınıfının bir örneği
isEqual :: Eq a => a -> a -> Bool
isEqual x y = x == y

-- Ord sınıfının bir örneği
compareValues :: Ord a => a -> a -> Ordering
compareValues x y = compare x y

-- Show ve Read sınıflarının bir örneği
showAndRead :: (Show a, Read a) => a -> a
showAndRead x = read (show x)

-- Num sınıfının bir örneği
addNumbers :: Num a => a -> a -> a
addNumbers x y = x + y

isEven :: Int -> String
isEven n = if n `mod` 2 == 0
           then "Even"
           else "Odd"

splitat::Int->[a]->([a], [a])
splitat n xs = (take n xs, drop n xs)
main::IO()
main = do
    putStrLn(show(isEqual 4 4))
    putStrLn(show(compareValues 8 9))
    print(isEven 5)
    print $ splitat 3 ['a', 'b', 'c', 'd', 'e', 'v']
    