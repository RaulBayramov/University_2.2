y :: Double -> Double
y x = if (x >= -2 && x /= 0.4)
        then (3*x^2 - 7*x - 3) / (5*x - 2)
        else if (x == 0.4)
            then 4*x^3 + 100 / (3*x) - 5
            else 7*(3.5 + 2*x) - 1 / (2.5*(1-x))

main::IO()

    
