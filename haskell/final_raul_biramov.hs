-- foldr_ :: (a -> b -> b) -> b -> [a] -> b
-- foldr_ _ v []     = v
-- foldr_ f v (x:xs) = f x (foldr_ f v xs)

-- reverseFoldr :: [a] -> [a]
-- reverseFoldr = foldr_ (\x acc -> acc ++ [x]) []

-- main :: IO ()
-- main = do
    
--     print $ reverseFoldr [1, 2, 3, 4] -- shedegi: [4, 3, 2, 1]
-- takeWhile_ :: (a -> Bool) -> [a] -> [a]
-- takeWhile_ p [] = []
-- takeWhile_ p (x:xs)
--     | p x = x : takeWhile_ p xs
--     | otherwise = []

-- myTakeWhile :: (a -> Bool) -> [a] -> [a]
-- myTakeWhile p xs = [x | x <- xs, p x]


-- main :: IO ()
-- main = do
--     print $ takeWhile_ (< 5) [1, 2, 3, 4, 5, 6, 7] -- shedegi: [1, 2, 3, 4]
--     print $ myTakeWhile (< 5) [1, 2, 3, 4, 5, 6, 7] -- shedegi: [1, 2, 3, 4]

-- Rekursif fonksiyon accumulator (dmgrov) parametresiyle
-- power :: Int -> Int -> Int
-- power x n = powerAcc x n 1
--   where
--     powerAcc :: Int -> Int -> Int -> Int
--     powerAcc _ 0 acc = acc
--     powerAcc x n acc = powerAcc x (n - 1) (acc * x)

-- -- Aynı fonksiyon lambda notasyonu ile
-- powerLambda :: Int -> Int -> Int
-- powerLambda x n = (\x n acc -> if n == 0 then acc else (\f -> \x n acc -> if n == 0 then acc else f f x (n - 1) (acc * x)) (\f -> \x n acc -> if n == 0 then acc else f f x (n - 1) (acc * x)) x n acc) x n 1

-- -- Fonksiyonun tipi
-- --power :: Int -> Int -> Int

-- -- Fonksiyonun çağrım örnekleri
-- main :: IO ()
-- main = do
--     print $ power 2 


-- რეკურსიული ფუნქცია დამგროვებელი პარამეტრით
-- რეკურსიული ფუნქცია დამგროვებელი პარამეტრით
-- power fonksiyonu
-- power :: Int -> Int -> Int
-- power x n = powerAcc x n 1
--   where
--     powerAcc :: Int -> Int -> Int -> Int
--     powerAcc _ 0 acc = acc
--     powerAcc x n acc = powerAcc x (n - 1) (acc * x)

-- powerLambda :: Int -> Int -> Int
-- powerLambda = \x n ->
--     let
--         calc :: (Int -> Int -> Int -> Int) -> Int
--         calc f = f x n 1
--     in
--         (\f x n acc -> if n == 0 then acc else f f x (n - 1) (acc * x)) calc
-- -- Fonksiyonun örnek kullanımı
-- main :: IO ()
-- main = do
--     print $ power 2 3          -- 2^3 = 8
--     print $ powerLambda 2 3    -- 2^3 = 8


-- ფუნქციის გამოძახების მაგალითები


-- position :: Eq a => a -> [a] -> Maybe Int
-- position _ [] = Nothing
-- position x (y:ys)
--   | x == y    = Just 0
--   | otherwise = case position x ys of
--                   Just n  -> Just (n + 1)
--                   Nothing -> Nothing
-- main :: IO ()
-- main = do
--     print $ position 3 [1, 2, 3, 4, 5]   -- shedegi: Just 2 
--     print $ position 6 [1, 2, 3, 4, 5]   -- shedegi: Nothing 
--     print $ position 'a' "Haskell"      -- shedegi: Nothing 
--     print $ position 's' "Haskell"      -- shedegi: Just 3 

-- data NoteBook = Reminder String Int Int | Tel String Int | Meeting Int Int Int String deriving (Eq, Show)

-- -- magaliti monacemebi
-- notebook :: [NoteBook]
-- notebook = [Reminder "Raul" 10 9, Tel "Nata" 577424861, Meeting 10 7 1100 "Durna"]
-- notebook2 :: [NoteBook]
-- notebook2 = [Reminder "Daniel" 10 12, Tel "Demetre" 599066546, Meeting 10 7 1100 "Dato"]


-- getTel :: String -> [NoteBook] -> Maybe Int
-- getTel _ [] = Nothing
-- getTel name (Tel n telNum : xs)
--   | name == n = Just telNum
--   | otherwise = getTel name xs
-- getTel name (_ : xs) = getTel name xs


-- getByLetter :: Char -> [NoteBook] -> [String]
-- getByLetter _ [] = []
-- getByLetter letter (Reminder name _ _ : xs)
--   | head name == letter = name : getByLetter letter xs
--   | otherwise = getByLetter letter xs
-- getByLetter letter (Tel name _ : xs)
--   | head name == letter = name : getByLetter letter xs
--   | otherwise = getByLetter letter xs
-- getByLetter letter (Meeting _ _ _ name : xs)
--   | head name == letter = name : getByLetter letter xs
--   | otherwise = getByLetter letter xs


-- main :: IO ()
-- main = do
--     putStrLn "Telephone of Nata:"
--     print $ getTel "Nata" notebook  
    
--     putStrLn "\nNames starting with 'D':"
--     print $ getByLetter 'D' notebook2  


-- power :: Int -> Int -> Int
-- power x n = powerAcc x n 1
--   where
--     powerAcc :: Int -> Int -> Int -> Int
--     powerAcc _ 0 acc = acc
--     powerAcc x n acc = powerAcc x (n - 1) (acc * x)

-- power :: Int -> Int -> Int --funkciis tipi
-- power x n = powerAcc x n 1
--   where
--     powerAcc :: Int -> Int -> Int -> Int--funkciis tipi
--     powerAcc _ 0 acc = acc
--     powerAcc x n acc = powerAcc x (n - 1) (acc * x)


-- powerLambda :: Int -> Int -> Int --funkciis tipi
-- powerLambda = \x n ->
--     let
--         -- innerPower :: Int -> Int -> Int -> Int
--         innerPower = \x' n' acc' ->
--             if n' == 0
--                 then acc'
--                 else innerPower x' (n' - 1) (acc' * x')
--     in
--         innerPower x n 1


-- main :: IO ()
-- main = do
--     print $ power 2 3          -- 2^3 = 8
--     print $ powerLambda 2 3    -- 2^3 = 8

foldr_ :: (a -> b -> b) -> b -> [a] -> b
foldr_ _ v []     = v
foldr_ f v (x:xs) = f x (foldr_ f v xs)

reverseFoldr :: [a] -> [a]
reverseFoldr = foldr_ (\x acc -> acc ++ [x]) []

reverse_r :: [a] -> [a]
reverse_r [] = []
reverse_r (x:xs) = reverse_r xs ++ [x]

main :: IO ()
main = do
    print $ reverseFoldr [1, 2, 3, 4] -- shedegi: [4, 3, 2, 1]
    print $ reverse_r [1, 2, 3, 4]    -- shedegi: [4, 3, 2, 1]

