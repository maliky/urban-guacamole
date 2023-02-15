et :: Bool -> Bool -> Bool
True `et` True = True
True `et` False = False
False `et` True = False
False `et` False = False
