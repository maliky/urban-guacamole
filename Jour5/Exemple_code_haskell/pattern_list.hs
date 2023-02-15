test :: [Char] -> Bool 
test ['a',_,_] = True
test _ = False

test' :: String -> Bool 
test' ['a',_,_] = True
test' _ = False
