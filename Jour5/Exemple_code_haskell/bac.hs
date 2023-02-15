paires :: [a] -> [(a,a)]
paires xs = zip xs (tail xs)
