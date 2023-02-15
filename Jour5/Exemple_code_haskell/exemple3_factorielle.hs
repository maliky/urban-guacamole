{- Ecrire la Fonction factorielle de facon recurcive -}

factorielle 0 = 1
factorielle n = n * factorielle (n - 1)

moyenne ns = (sum ns) `div` (length ns)
