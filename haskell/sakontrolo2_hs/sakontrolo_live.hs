--davaleba1 is kodebi
davaleba1_rekursiulad :: [Int] -> [Int]
davaleba1_rekursiulad [] = []  
davaleba1_rekursiulad (x:xs)
    | x > 150 && x < 400 = x : davaleba1_rekursiulad xs  
    | otherwise = davaleba1_rekursiulad xs  

davaleba1_siis_konstruktorit :: [Int] -> [Int]
davaleba1_siis_konstruktorit xs = [x | x <- xs, x > 150 && x < 400]

--davaleba2-is kodebi
davaleba2_rekursiulad :: Int -> Int -> [Int]
davaleba2_rekursiulad x1 x2
    | x1 > x2   = []
    | x1 `mod` 11 == 0 && x1 `mod` 2 == 0 = x1 : davaleba2_rekursiulad (x1 + 1) x2
    | otherwise = davaleba2_rekursiulad (x1 + 1) x2

davaleba2_siis_konstruktorit:: Int -> Int ->[Int]
davaleba2_siis_konstruktorit x1 x2 = [x|x<-[x1..x2], x `mod` 11 ==0 && x `mod` 2 == 0]

--davaleba3
davaleba3 :: [a] -> Int -> a
davaleba3 [] n = error "listi charielia"
davaleba3 (x:xs) 0 = x
davaleba3 (x:xs) n = davaleba3 xs (n-1)

-- davaleba4 is kodebi
davaleba4_siis_konstruktorit :: [a] -> Int -> [a]
davaleba4_siis_konstruktorit xs n = [x | (i, x) <- zip [0..] xs, i /= n]

davaleba4_rekursiulad :: [a] -> Int -> [a]
davaleba4_rekursiulad [] _ = []
davaleba4_rekursiulad (x:xs) n
    | n == 0    = xs
    | otherwise = x : davaleba4_rekursiulad xs (n - 1)


main :: IO ()
main =do
    -- --davaleba1
    -- let list = [50, 160, 200, 350, 401, 499]
    -- print $ "davaleba1_rekursiulad parametri([50, 160, 200, 350, 401, 499]): " ++ show (davaleba1_rekursiulad list)  
    -- print $ "davaleba1_siis_konstruktorit igive parametrit: " ++ show(davaleba1_siis_konstruktorit list)
    
    -- --davaleba2
    --  print $ "davaleba2_rekursiulad: parametrebi(1 da 100): "  ++ show(davaleba2_rekursiulad 1 100)
    --  print $ "davaleba2_siis_konstruktorit: parametrebi(1 da 100): "  ++ show(davaleba2_siis_konstruktorit 1 100)
    
    -- --davaleba3
     --print $ "davaleba3: parametrebit([50, 160, 200, 350, 401, 499], 3), shenishvna indexi icyeba 0-dan: " ++ show(davaleba3 [50, 160, 200, 350, 401, 499] 3)
    
    
     print $ "davaleba4_rekursiulad: parametrebit ([50, 160, 200, 350, 401, 499], 4): " ++ show(davaleba4_rekursiulad [50, 160, 200, 350, 401, 499] 4)
     print $ "davaleba4_siis_konstruktorit: parametrebit ([50, 160, 200, 350, 401, 499], 4): " ++ show(davaleba4_siis_konstruktorit [50, 160, 200, 350, 401, 499] 4)
    


   
    

