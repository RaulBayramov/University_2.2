factorial :: Int -> Int
factorial n
    | n < 0     = error "Negative numbers are not allowed"
    | n == 0    = 1
    | otherwise = n * factorial (n - 1)

elem1 :: Eq a => a -> [a] -> Bool
elem1 _ [] = False
elem1 n (x:xs) 
    | n == x    = True
    | otherwise = elem1 n xs

-- sayi bos liste konbinasyonu = false
-- n ve listenin headini karsilastir
-- n==x True
-- else xs(liste headsiz) le tekrar rekusiv sekilde ara
davaleba3:: Int -> Int ->[Int]
davaleba3 x1 x2 = [x|x<-[x1..x2], x `mod` 11 ==0 && x `mod` 2 == 0]

-- Fonksiyonun tipi: Int -> [Int] -> [Int]
replaceWithSquare :: Int -> [Int] -> [Int]
replaceWithSquare _ [] = []  -- Eğer liste boşsa, boş liste döndür
replaceWithSquare n xs
    | (n-1) < 0 || (n-1) >= length xs = xs  -- Eğer indeks geçersizse, orijinal listeyi döndür
    | otherwise = take (n-1) xs ++ [xs !! (n-1) ^ 2] ++ drop (n ) xs
    -- Listeden n. indekse kadar olan kısmı al, n. elemanı karesiyle değiştir, ve kalan kısmı ekle
    
evenlist:: [Int] -> [Int]
evenlist xs = [x|x<-xs, x `mod` 2==0]

oddlist:: [Int] -> [Int]
oddlist xs = [x|x<-xs, x `mod` 2==1]

davaleba5:: [Int] -> [Int]
davaleba5 xs = evenlist xs ++ oddlist xs

removeempty:: [String] -> [String]
removeempty xs = [x| x<-xs, x/=""]

removeEmp:: [String] -> [String]
removeEmp [] = []
removeEmp (x:xs) = if x== "" then removeEmp xs
else x:removeEmp xs

-- fun7 fonksiyonu tanımı
fun7 :: [Int] -> [Int]
fun7 [] = []  -- Eğer liste boşsa, boş liste döndür
fun7 (x:xs) = if x < 0
              then (-x) : fun7 xs  -- Negatifse, negatif olmayan hale getir ve listeye ekle
              else x : fun7 xs      -- Değilse, olduğu gibi listeye ekle

removeTwoDigit :: [Int] -> [Int]
removeTwoDigit [] = []  -- Eğer liste boşsa, boş liste döndür
removeTwoDigit (x:xs)
    | x < 10 || x >= 100 = x : removeTwoDigit xs  -- Tek basamaklı veya üç veya daha fazla basamaklıysa, elemanı sonuca ekle
    | otherwise = removeTwoDigit xs  -- İki basamaklıysa, sonuca ekleme ve kalan listeyi işle

main::IO()
main = do
    print $ "davaleba1: " ++ show(factorial 5) 
    print $ "davaleba2: " ++ show(elem1 5 [1, 2, 3, 4, 5, 5])
    print $ "davaleba3: " ++ show(davaleba3 1 34)
    print $ "davaleba4(index icgeba 1-dan gamoyenebis gasmartiveblad:).): " ++ show(replaceWithSquare 3 [1, 2, 3, 4, 5, 5])
    print $ "davaleba5: " ++ show(davaleba5 [1, 2, 3, 4, 5, 5])
    let list= ["Ad", "", "sfregerg", "", "", "hht"]
    print $ "davaleba6: " ++ show(removeEmp list)
    let list = [-1, 2, -3, 4, -5]
    print $ "davaleba7: " ++ show (fun7 list)  -- Çıktı: "davaleba7: [1,2,3,4,5]"
    print $ "davaleba8: " ++ show (removeTwoDigit [11, 4, 66, 5, 6, 99, 77])

