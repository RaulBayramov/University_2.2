module Sakontrolo2 where
import Text.Printf (errorBadArgument)

-- დავით გოგრიჭიანი
-- საკონტროლო 2

-- 1.
orisxarisxebi :: (Integral b, Num a) => [b] -> [a]
orisxarisxebi [] = []
orisxarisxebi (x:xs) = (2^x) : orisxarisxebi xs

-- 2.
ff :: (Eq t, Num t) => t -> a -> [a]
ff 0 _ = []
ff n m = m : ff (n-1) m

-- 3.
hh :: Integral a => a -> a -> [a]
hh n m = gg n m n

-- დამხმარე ფუნქცია
gg :: Integral a => t -> a -> a -> [a]
gg n m b
    | b > m = []
    | mod b 10 == 0 = b : gg n m (b+10)
    | otherwise = gg n m (b+1)

-- 4.
disc :: (Eq t, Num t) => t -> [p] -> p
disc 0 (x:xs) = x
disc _ [] = errorBadArgument 
disc n (x:xs) = disc (n-1) xs

-- 5
listsum :: Num a => [a] -> [a] -> [a]
listsum [] _ = []
listsum _ [] = []
listsum (x:xs) (y:ys) = x+y : listsum xs ys

-- 6
swaplist :: Integral a => [a] -> [a]
swaplist [] = []
swaplist (x:[]) = []
swaplist (x:y:xs)
    | odd x && even y = y:x : swaplist xs
    | even x && odd y = y:x : swaplist xs
    | otherwise = swaplist xs


-- 7
delete :: Char  -> String  -> String
delete n [] = []
delete n (x:xs)
    | x /= n = delete n xs
    |otherwise = x : delete n xs

-- 8
datoveba :: (Ord a, Num a) => [a] -> [a]
datoveba [] = []
datoveba (x:xs)
    | x > 150 && x < 400 = x : datoveba xs
    |otherwise = datoveba xs
