-- Desen eşleştirme örneği
describeList :: [a] -> String
describeList [] = "The list is empty."
describeList [_] = "The list has one element."
describeList [_, _] = "The list has two elements."
describeList _ = "The list has more than two elements."


-- İlk 10 doğal sayıların kareleri
squares :: [Int]
squares = [x * x | x <- [1..5]]

-- 1'den 10'a kadar olan çift sayılar
evens :: [Int]
evens = [x | x <- [1..10], even x]

-- Listedeki sayıların ortalamasını hesaplayan fonksiyon
mean :: (Fractional a) => [a] -> a
mean xs = sum xs / fromIntegral (length xs)

-- Verilen bir listenin standart sapmasını hesaplayan fonksiyon
stdDev :: (Floating a) => [a] -> a
stdDev xs = sqrt $ mean $ map (\x -> (x - m) ^ 2) xs
  where
    m = mean xs

concats    :: [[a]] -> [a]
concats xss = [x | xs <- xss, x <- xs]

factors  :: Int -> [Int]
factors n =
   [x | x <- [1..n], n `mod` x == 0]

isprime :: Int -> Bool
isprime n = describeList (factors n) == "The list has two elements."

primes :: Int -> [Int]
primes n = [x | x <- [2..n], isprime x]

tamamla :: [a] -> [b] -> [(a,b)]
tamamla [] _ = []
tamamla _ [] = []
tamamla (x:xs) (y:ys) = (x,y) : tamamla xs ys

pairs   :: [a] -> [(a,a)]
pairs xs = tamamla xs (tail xs)

sorted   :: Ord a => [a] -> Bool
sorted xs =
   and [x <= y | (x,y) <- pairs xs]

positions :: Eq a => a -> [a] -> [Int]
positions x xs =
   [i | (x_,i) <- tamamla xs [0..n], x == x_]
   where n = length xs - 1

pyts :: Int -> [(Int, Int, Int)]
pyts n = [(x, y, z)| z<-[1..n], y<-[1..n], x<-[1..n], x^2 + y^2 == z^2 ]
main::IO()
main = do
    putStrLn(show(describeList [1, 2]))
    putStrLn( show squares)
    putStrLn(show(concats [[1, 2, 4], [5, 6], [8, 12]]))
    let numbers = [1, 2, 3, 4, 5] -- Örnek bir liste
    putStrLn $ "Standart sapma: " ++ show (stdDev numbers)
    putStrLn $ "12 nin bolenleri: " ++ show (factors 12)
    print $ "<=20 asal sayilar: " ++ show(primes 20)
    print $ "zip arrays: " ++ show(tamamla [1, 2,3 ,4, 5] [4, 4, 7, 8])
    print $ "zip arrays: " ++ show(tamamla [1, 2,3 ,4, 5] "Aynur")
    print $ "{1, 2, 3, 4, 5, 6} kumesinin 2 elemanli alt kumeleri: " ++ show(pairs [1, 2, 3, 4, 5, 6])
    print $ "{1, 2, 3, 4, 5, 6} kumesinin elemanlari siralimi : " ++ show(sorted [1, 2, 3, 4, 5, 6])
    print $ " 5 sayisinin {5, 4, 3431, 5, 5, 4, 39, 9, 33, 5} listesindeki koumlari(i kumesi):" ++ show(positions 5 [5, 4,3431,5, 5, 4, 39, 9, 33, 5])
    print $ "20 kadar rakamlarin pisagor ucluleri: " ++ show(pyts 20)