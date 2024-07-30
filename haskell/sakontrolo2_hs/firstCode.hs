import Data.Void (vacuous)
import Control.DeepSeq (NFData)
import Distribution.Simple.LocalBuildInfo (InstallDirs(prefix))
import Data.Binary.Builder (append)
import System.Win32 (COORD(yPos), xBUTTON1)
sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

half :: Integer -> Integer
half x = x `div` 2

square :: Integer -> Integer
square x = x * x

add :: Integer -> Integer -> Integer
add a b = a + b

multiply_b :: Integer -> Integer -> Integer
multiply_b a b = a * b

factorial n = product [1..n]
average ns  = sum ns `div` length ns

multiply_pi_x :: Double -> Double
multiply_pi_x a  = pi*(a*a)

prefix1 :: a -> a -> [a]
prefix1 x y = [x, y]

prefix2 :: a -> [a]-> [a]
prefix2 x y = x: y

prefix3 :: [a] -> [a] -> [a]
prefix3 x y = x ++ y

postfix :: a -> [a] -> [a]
postfix x xs = xs ++ [x]

isEmpty:: [a] -> String
isEmpty xs 
    | null xs = "list is empty"
    | otherwise = "list is not empty"
power:: Integer -> Integer -> Integer
power x y
    |y==0 = 1
    |y==1 = x
    |y>1 = x * power x (y-1)
main :: IO ()
main = do
    sayHello "world"
    print (square (half 5))  -- half işlevinin sonucunu ekrana yazdır
    print (square 5)
    let result = add 3 5
    print result

    let resultM = multiply_b 4 5
    print resultM

    print ("pi*a*b: ")
    let pi_a_b = multiply_pi_x 5
    print pi_a_b

    let result11 = average [1, 2, 3, 4, 5]
    putStrLn ("result of average function with parametr [1,2 3, 4, 5]: " ++ show (result11))
    let fac_r = factorial 5
    putStrLn ("result of factorial function with parametr 5: " ++ show (fac_r))


    let b = 4
        c = 8
        a = b + c
        d = a * 2
    print d


    let w = z + n
            where
                z = 5
                n = 90
        y = w + w
    print y

    let a = 10
        xs = [1,2,3,4,5]
        l = a `div` length xs
    print l

    let x = 'a'
        xs2 = "zurn"
        n = postfix x xs2
    print n

    let tail_ =  tail xs2
    print tail_

    let head_ = head xs2
    print head_

    let exp = postfix a as
            where
                a = 16
                as =[1, 2 .. 15]
    print exp

    --x in List (A) & x =/= [] => head (x) in A; tail (x) in List (A)
    let x = [1, 2, 3]
        y = [5, 6]
        eq = prefix3 x y
        headd = head eq
        taill = tail eq
        aksiom = prefix2(head eq) (tail eq)
    putStrLn("head: " ++ show headd ++ "\n tai: " ++ show taill ++ "\n prefix head tail: " ++ show aksiom)
    putStrLn(isEmpty aksiom)
    
    let a = 5
        b = 4
        result  =  power a b
    print result
    putStrLn("mevcut program calisiyor")