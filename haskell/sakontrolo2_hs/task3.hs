splitList :: Int -> [a] -> ([a], [a])
splitList n xs = splitAt n xs

sumOfThree :: Num a => [a] -> a
sumOfThree xs = sum (take 3 xs)

solveLinearEquation :: Double -> Double -> (Bool, Double)
solveLinearEquation a b
    | a == 0 = if b == 0 then (True, 0) else (False, 0)
    | otherwise = (True, -b / a)

main :: IO ()
main = do
    
    let myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        (firstPart, secondPart) = splitList 5 myList
    putStrLn "Split List:"
    print firstPart
    print secondPart

   
    let numbers = [10, 20, 30, 40, 50]
        sumFirstThree = sumOfThree numbers
    putStrLn "\nSum of First Three Elements:"
    print sumFirstThree

  
    let (hasSolution, solution) = solveLinearEquation 2 3
    putStrLn "\nLinear Equation Solution:"
    if hasSolution
        then putStrLn ("The solution is: " ++ show solution)
        else putStrLn "No solution exists for the given coefficients."
