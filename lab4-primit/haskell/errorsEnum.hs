data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, Read, Enum, Bounded)

data Result = ABitDifferent | Infinity | Zero | VeryDifferent
    deriving (Show, Read, Enum, Bounded)

error2Result :: Error -> Result
error2Result FP_Rounding  = ABitDifferent
error2Result FP_Overflow  = Infinity
error2Result FP_Underflow = Zero
error2Result Int_Overflow = VeryDifferent

result2Error :: Result -> Error
result2Error ABitDifferent = FP_Rounding
result2Error Infinity      = FP_Overflow
result2Error Zero         = FP_Underflow
result2Error VeryDifferent = Int_Overflow

allErrors :: [Error]
allErrors = [minBound .. maxBound]

allResults :: [Result]
allResults = [minBound .. maxBound]

main :: IO ()
main = do
    putStrLn ("known errors = " ++ show allErrors)
    error <- getLine
    putStrLn (show error ++ " results in: " ++ show (error2Result (read error)))

    putStrLn ("known results = " ++ show allResults)
    result <- getLine
    putStrLn (show result ++ " results from: " ++ show (result2Error (read result)))
