module Shualeduri where

-- Davit Gogritchiani
-- Shualeduri 1

gamosaxuleba :: (Fractional a, Ord a) => a -> a
gamosaxuleba x
  | x == -2.5 = 3.75 * x^2 + 10/(2-x)*(1+4*x)
  | x >= -3.7 && x<= 7 = (1-x^2 + 8.2*x)/(x+2.5) - 4
  | otherwise = 5*x - 7 + (3.5*x^3)/(4*(1.5+x))


gamosaxuleba1 :: (Fractional a, Ord a) => a -> a
gamosaxuleba1 x =
    if x == -2.5
        then 3.75 * x^2 + 10/(2-x)*(1+4*x)
    else if x >= -3.7 && x <= 7
        then (1-x^2 + 8.2*x)/(x+2.5) - 4
    else 5*x - 7 + (3.5*x^3)/(4*(1.5+x))

--- 2.

firstLambda :: Integer
firstLambda = (\xs -> xs!!1)[1..10]

secondLambda :: [Integer]
secondLambda = map (\ x-> if mod x 2 == 0 then x^2 else x^3)[1..10]

thirdLambda :: [Integer]
thirdLambda = (\ x xs -> xs ++ [x])1 [1..10]

--- 3.

($$) :: Bool -> Bool -> Bool
True $$ True = True
False $$ True = True
True $$ False = False
False $$ False = True

--- 4.

listofOdds :: [Integer]
listofOdds = [x | x <- [100..999] , (mod x 10 + div (mod x 100 ) 10 + div x 100) `mod` 2 == 1]


-- ლოგიკა მარტივი რიცხვისთვის
isPrime :: Integral a => a -> Bool
isPrime k = (k > 1) && null [ x | x <- [2..k - 1], k `mod` x == 0]

-- ლისტის კონსტრუქტორი 2-500 მდე
-- წინასწარ განსაზღვრულია
primeList :: [Integer]
primeList = [x | x <- [2..500], isPrime x]

triple :: Integer -> [(Integer, Integer, Integer)]
triple n = [(x, y, x+y) | x <- primeList, y <- primeList, x+y <= n && isPrime (x+y)]


-- 5.

couple :: a -> b -> (a, b)
couple x y = (x,y)
-- REPL
--let couple x y = (x,y)

isPalindromeString :: Eq a => [a] -> Bool
isPalindromeString xs = reverse xs == xs
-- REPL
--let isPalindromeString xs = reverse xs == xs

isSorted :: Ord a => a -> a -> a -> Bool
isSorted x y z
  | x <= y && y <= z = True
  | x >= y && y >= z = True
  | otherwise = False
-- REPL
-- let isSorted x y z = if x <= y && y <= z then True else if x >= y && y>= z then True else False