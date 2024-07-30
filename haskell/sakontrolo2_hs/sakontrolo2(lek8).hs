factorial:: Int -> Int
factorial n = if n==0 || n==1 then 1 else n*factorial(n-1)

factorial1 :: Int -> Int
factorial1 n
  | n == 0    = 1
  | n > 0     = n * factorial1 (n - 1)

products       :: [Int] -> Int
products []     = 1
products (n:ns) = n * products ns

reverse_       :: [a] -> [a]
reverse_ []     = []
reverse_ (x:xs) = reverse_ xs ++ [x]

zip_              :: [a] -> [b] -> [(a,b)]
zip_ []     _      = []
zip_ _      []     = []
zip_ (x:xs) (y:ys) = (x,y) : zip_ xs ys

qsort       :: [Int] -> [Int]
qsort []     = []
qsort (x:xs) =
   qsort smaller ++ [x] ++ qsort larger
   where
      smaller = [a | a <- xs, a <= x]
      larger  = [b | b <- xs, b > x]

main::IO()
main = do 
    print $ factorial(4)
    print $ show(reverse_ [1, 2, 3, 4])
    print $ show(products [1, 2, 3, 4])
    print $ show(zip_ [11, 22, 33] [1, 2, 3, 4])
    print $ show $ qsort [4, 9, 3, 1, 10]
    


