--create inpFunc
inpFunc a b = [a..b] 

--Define applicatorFunc
applicatorFunc inpFunc a b s | s=='s'   = sum (inpFunc a b) 
            | otherwise = (sum (inpFunc a b))/(b-a+1)

main = do
    let result = applicatorFunc inpFunc 1 5 's' --Call applicatorFunc with inpFunc and 'a' as args
    putStrLn("sum = " ++ show(result))