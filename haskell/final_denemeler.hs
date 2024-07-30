-- my_foldr :: (a -> b -> b) -> b -> [a] -> b
-- my_foldr _ v []     = v
-- my_foldr f v (x:xs) = f x (my_foldr f v xs)

-- sum_ :: [Int] -> Int
-- sum_ = my_foldr (+) 0

-- product_ :: [Int] -> Int
-- product_ = my_foldr (*) 1

-- concat_ :: [[a]] -> [a]
-- concat_ = my_foldr (++) []
 -- print $ "sum'is shedegi: " ++ show(sum [1, 2 ..5])
    -- print $ "product'is shedegi: " ++ show(product [1, 2 ..5])
    -- print $ concat_ [[1, 2], [3, 4]]
-- myMap :: (a -> a) -> [a] -> [a]
-- myMap _ [] = []
-- myMap f (x:xs) = f x : myMap f xs

-- myMap_c :: (a -> a) -> [a] -> [a]
-- myMap_c _ [] = []
-- myMap_c f xs = [f x | x <- xs]

-- myFilter :: (a -> Bool) -> [a] -> [a]
-- myFilter _ [] = []
-- myFilter p (x:xs)
--     | p x       = x : myFilter p xs
--     | otherwise = myFilter p xs

-- myFilter_c :: (a -> Bool) -> [a] -> [a]
-- myFilter_c _ [] = []
-- myFilter_c p xs = [x | x <- xs, p x]

-- main :: IO ()
-- main = do
--     let result = myMap (+1) [1, 2, 3, 4]
--     print result
--     let result2 = myMap_c (+1) [1, 2, 3, 4]
--     print result2
--     let filterResult = myFilter odd [1, 2 .. 10]
--     print filterResult
--     let filterResult_c = myFilter_c odd [1, 2 .. 10]
--     print filterResult_c


-- 1. Bir listenin elemanlarının toplamını ve uzunluğunu döndüren işlev
sumAndLength :: (Num a) => [a] -> (a, Int)
sumAndLength [] = (0, 0)
sumAndLength (x:xs) = 
    let (sumTail, lengthTail) = sumAndLength xs
    in (x + sumTail, 1 + lengthTail)

-- 2. Bir listenin maksimum ve minimum elemanlarını döndüren işlev
maxAndMin :: (Ord a) => [a] -> (a, a)
maxAndMin [] = error "Empty list"
maxAndMin [x] = (x, x)
maxAndMin (x:xs) = 
    let (maxTail, minTail) = maxAndMin xs
    in (max x maxTail, min x minTail)

-- 3. Bir listedeki tek ve çift sayıların sayısını döndüren işlev
countOddEven :: [Int] -> (Int, Int)
countOddEven [] = (0, 0)
countOddEven (x:xs) = 
    let (oddCount, evenCount) = countOddEven xs
    in if odd x 
       then (1 + oddCount, evenCount) 
       else (oddCount, 1 + evenCount)

-- 4. Bir listeyi tersine çeviren işlev
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- Main function for testing
main :: IO ()
main = do
    let list1 = [1, 2, 3, 4, 5]
    let list2 = [10, 5, 8, 3, 7]

    -- Test sumAndLength
    print $ sumAndLength list1 -- Output: (15, 5)
    
    -- Test maxAndMin
    print $ maxAndMin list2 -- Output: (10, 3)
    
    -- Test countOddEven
    print $ countOddEven list1 -- Output: (3, 2)
    
    -- Test reverseList
    print $ reverseList list1 -- Output: [5, 4, 3, 2, 1]
    