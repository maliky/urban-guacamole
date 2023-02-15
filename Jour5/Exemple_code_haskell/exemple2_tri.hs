-- exemple du programme de tri
tri_vite [] = []
tri_vite (x:xs) = tri_vite plus_petits ++ [x] ++ tri_vite plus_grands
    where
      plus_petits = [a | a <- xs , a <= x]
      plus_grands = [b | b <- xs, b > x]
