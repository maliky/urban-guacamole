-- Fonctions
--  Une fonction Haskell est une relation entre un ou plusieurs paramètres et un résultat.   On la définit à l'aide d'une équation qui donne le nom de la fonction et de chacun des paramètres.   Dans le corps de la fonction, on code comment le résultat doit être obtenu avec les paramètres.   par exemple.


double x = x + x

sum [1..n]

-- Exemples de code Haskell


sum [] = 0
sum (n:ns) = n + sum ns

sum [1,2,3]


-- function sum

-- en Haskell toutes les fonctions ont un type.

:t sum

-- trier les valeurs

qsort [] = []
qsort (x:xs) = qsort smaller ++  [x] ++ qsort larger
               where
                 smaller = [a | a <- xs, a <= x]
                 larger =  [b | b <- xs, b > x]


-- Prélude est le nom de l'environnement chargé par défaut par le compilateur.   l'invite de commande '>'  indique que le système attend une commande de l utilisateur.


> 2+3*4



-- #+RESULTS:
-- : 14


> (2+3)*4



-- #+RESULTS:
-- : 20


> sqrt (3^2 + 4^2)

-- head
--  Sélectionne le premier élément d'une liste non vide


head  [1,2,3,4,5]

-- tail
--  Enlève le premier élément d'une liste  mon vide.

tail [1,2,3,4,5]

-- !!
--  Sélectionne le nénième élément d'une liste non vide.   le premier numéroté zéro.

[1,2,3,4,5]  !! 2

-- take
--  Sélectionne les n premiers éléments d'une liste

take 3 [1,2,3,4,5]

-- drop
--  Supprime les n premiers éléments d'une liste

drop 3 [1,2,3,4,5]

-- length
--  calcule la longueur d'une liste

length [1,2,3,4,5]

-- sum
--  fais la somme d'une liste

sum [1,2,3,4,5]

-- product
--  calcule le produit des éléments d'une liste

product [1,2,3,4,5]

-- ++ (concatène)
-- Concatène ou rassemble deux listes

[1,2,3] ++ [4,5]

-- reverse
--  renverse les éléments d'une liste


reverse [1,2,3,4,5]

-- Comment appeler une fonction
--  Les paramètres d'une fonction sont simplement séparés par des espaces.    Les parenthèses indiquent la priorité des opérations,  sachant qu'un  appel à une fonction est prioritaire par rapport aux opérations standards mathématiques, par exemple:


f a + b


-- veut dire $f(a) + b$ et non $f(a+b)$.


f a b + c*d

-- Scripts Haskell
--   Les scripts Haskell ont généralement pour extensions `.hs`.    
--  Supposons que nous ayons le code suivant dans un fichier appelé test.hs

double x = x + x

quadruple x = double (double x)



-- cela va charger les définitions des fonctions et le pourront les utiliser a l'intérieur de ghci


> quadruple 10
40

> take (double 2) [1,2,3,4,5,6,7,8]
[1,2,3,4]



-- cependant lorsque nous effectuons une modification dans le fichier test.hs, ghci ne recharge pas automatiquement les modifications.  il faut utiliser la commande :reload.

-- ajoutons les deux fonctionnent suivantes à notre fichier test.hs


factorielle n = product [1..n]

moyenne ns = sum ns  `div` length ns

-- Organisation du code
-- Comme dans python on utilise la notation pour grouper les expressions ensemble.


a = b + c
    where
      b = 1
      c = 2

d = a * 2



-- dans le code ci-dessus il est clair que b et c sont des variables localement définie dans a.

-- On peut rajouter des parenthèses et  séparer les définitions avec des ;


a = b + c
    where
      {b = 1;
       c = 2};

d = a * 2;

-- ce qui permet d'écrire le code sur une ligne
a' = b + c where {b=1; c=2}; d'= a'*2;

-- simples
--  Les commentaires simples commence avec le symbole --.   ils tiennent sur une ligne.


-- Factorielle des n premiers entiers
factorielle n = product [1..n]

-- commentaires imbriqués
-- Ils peuvent s'étendre sur plusieurs lignes et contenir des commentaires.   Ils sont pratiques pour commenter   des blocs de code.

{-  3 fonctions du fichier test.hs commentées

double x = x + x

quadruple x = double (double x)

-- Factorielle des n premiers entiers
factorielle n = product [1..n]
-}

moyenne ns = sum ns  `div` length ns

-- les booléens

:t True
:t False

-- les caractères
--  On utilise les guillemets simples pour noter des caractères.

:t 'a'



-- #+RESULTS:
-- : 'a' :: Char

--  On peut aussi utiliser la valeur numérique (décimal ou hexadécimal) telle que définie par [[https://en.wikipedia.org/wiki/List_of_Unicode_characters#Latin_script][le standard unicode]].   ce qui est utile pour saisir des caractères de contrôle comme '\n' ( nouvelle ligne ) ou '\t' ( tabulation).


:t '\97'
:t '\x61'
'\97' == 'a'
'\x61' == 'a'

-- fonction sur le caractères


import Data.Char
:t toUpper



-- #+RESULTS:
-- : 
-- : toUpper :: Char -> Char

--  tout d'abord nous avons importé une bibliothèque deux fonctions sur les caractères
--  puis nous avons demandé le type de l'une de ses fonctions,  'toUpper'.   son type indiquez à droite des :: est 'Char -> Char'  c'est-à-dire c'est une fonction qui prend en entrée un caractère et qui renvoie un caractère.


toUpper 'a'

-- String -- les chaînes de caractères
--  ce sont des séquences de caractères encadrés par des guillemets doubles

"abcd"
:t "efgh"

-- Int --  entier à précision fixe
--  Par exemple -100, 9  ou 0.    ils sont compris entre $-2^63$  et $2^63-1$.   en dehors de cet intervalle les résultats sont chaotique.


2^63 - 1
2^63 :: Int

-- Interger --  entiers sans précision fixée

--  Ce type contient des entiers aussi grand que peut en contenir la mémoire l'ordinateur.


2^63 :: Integer

-- Float --   nombres à virugle de précision simple
--  par exemple -12.34, 1.0 ou 3.1415927.   Leur taille en mémoire est limité  et leur précision dépend de la taille du nombre.


sqrt 2 :: Float
sqrt 9999 :: Float

-- Double --  nombres à virgule avec deux fois plus de précision
--  c'est un type similaire au "Float"  mais avec deux fois plus de place en mémoire afin d'accroître leur précision.


sqrt 2 :: Double
sqrt 9999 :: Double

-- Num --  les types numériques
--  il s'agit d'une classe qui contient tous les types ayant des valeurs numériques et sur lesquelles on peut utiliser les 6 méthodes suivantes.
-- - (+) : addition 
-- - (-) :  soustraction
-- - (*) :  multiplication
-- - negate :  opposé
-- - abs :  valeur absolue
-- - signum :  signe du nombre


:t 4 + 4



-- #+RESULTS:
-- : 4 + 4 :: Num a => a

--  ce résultat indique qu'il est d'un type a qui doit être un Num.    l'opérateur =>  indique la contrainte.


signum (-445)



-- #+RESULTS:
-- : -1

--  notez que les parenthèses sont importantes  pour que le signe - sont correctement interprété.   en mathématiques

-54 == (-54)
4 == (4)

-- Types liste

--  Une liste est une séquence d'éléments de même type.   Ils sont encadrés par des crochets et séparés par des virgules.   On note [T] le type de la liste dont tous les éléments sont de type T., par exemple :


:t  [False, True, False ] 
:t  ['a', 'b', 'c', 'd']

-- un peu plus compliqué
:t "Zéro"
:t  ["Un", "Deux", "Trois"]

-- Types tuple

--  Le tuple est un ensemble fini d'éléments de types  potentiellement différents.   On le note avec les parenthèses () et ses éléments sont séparés par des virgules.   On écrira $(T_1, T_2, \cdots, T_n)$  le type d'un tuple contenant des éléments de type $T_1, T_2 \cdots{} T_n$


:t (False, True)
:t ('a', "Bob", True)



-- #+RESULTS:
-- : (False, True) :: (Bool, Bool)
-- : ('a', "Bob", True) :: (Char, [Char], Bool)

-- la longueur d'un tube est appelée /arity/.   Le tuple de longueur zéro  est le tuple vide, mais attention nous ne pouvons avoir des singletons sous forme de tuple  car leur  notation entrerait en conflit avec l'usage mathématiques des parenthèses  qui définit l'ordre d'évaluation des opérations.  @@latex:(1+3)*4@@.


:t (False, ('a', True, "Alpha"), [('x','b','c')])

-- Types fonction
--  Une fonction est une relation entre des paramètres un certain type et un résultat dans notre type.   On note $T_1 -> T_2$  le type de toutes les fonctions qui mettent en relation  des paramètres de type $T_1$  un des résultats de type $T_2$.   par exemple,

:t not



-- #+RESULTS:
-- : not :: Bool -> Bool


:t even



-- #+RESULTS:
-- : even :: Integral a => a -> Bool
-- even dit si un nombre est impair ou non;    Notez que le type a,  doit appartenir à la classe des types Integral.   c'est un ensemble de type  numérique  pour qui les fonctions div et mod  sont définies.

--  Si la fonction a plusieurs paramètres il suffit de les passer en tant que tuple et les résultats peuvent être des listes.


ajouter :: (Int, Int) -> Int
ajouter (x,y) = x+y

zéroA :: Int -> [Int]
zéroA n = [0..n]



--  La convention en Haskell est de faire précéder la définition des fonctions par leur type.   Cela sert à la documentation et au débogage.

-- Notez:  les fonctions ne sont pas obligatoires définies sur l'ensemble de leur type.   Par exemple la fonction /head/ définie sur le type de liste,  on ne l'est pas pour la liste vide

:t head



-- #+RESULTS:
-- : head :: [a] -> a


head []

-- Curried Function
--  Les fonctions avec plusieurs paramètres peuvent être gérées en utilisant a propriété quand Haskell  une fonction elle-même peut avoir une autre fonction comme paramètre.

--  comparez les deux fonctions ajouter


ajouter :: (Int, Int) -> Int
ajouter (x,y) = x+y

ajouter' :: Int -> (Int -> Int)
ajouter' x y = x+y



-- La seconde fonction ajouter  c'est une fonction qui prend en paramètre un entier et renvoie une fonction  de type @@haskell:Int->Int@@

--  Un autre exemple

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z



-- les fonctions qui renvoient des fonctions s'appellent /curried functions/  en l'honneur d'Haskell Curry.

-- Notez que par convention on omettra les parenthèses.

mult :: Int -> (Int -> (Int -> Int))


-- est identique à

mult :: Int -> Int -> Int -> Int



-- et 

mult x y z



-- veut dire

((mult x) y) z

-- Type Polymorphique
--  la fonction /head/   renvoie le premier élément d'une liste indépendamment du type de cette dernière.   

head [1,2,3,4]



-- #+RESULTS:
-- : 1


head ["Soumahoro", "Kanté"]



-- #+RESULTS:
-- : Soumahoro


head "Kirina"



-- #+RESULTS:
-- : 'K'

-- C'est donc une fonction qui s'applique à plusieurs types.  sa spécificité est précisé lorsque on regarde le type la fonction.

:t head



-- #+RESULTS:
-- : head :: [a] -> a

-- Il fait apparaître une variable de type /type variable/   notez avec une lettre minuscule souvent simplement $a,b,c \cdots$

--  Un type kit contient une variable de type est appelé type polymorphique.


:doc fst



-- : fst extrait le premier élément d'une paire

-- : fst :: (a, b) -> a

-- fst a un type qui contient deux variables de type (/type variable/).   sur type est donc polymorphe.


fst ("Palmier", 4)

-- Ord --  les types  ordonnés
--  Cette classe contient tous les types de la classe égalité $Eq$ et qui en plus supporte les méthodes 6 suivantes:

-- #+RESULTS:
-- : (<) :: a -> a -> Bool
-- : (>) :: a -> a -> Bool
-- : (<=) :: a -> a -> Bool
-- : (>=) :: a -> a -> Bool
-- : min :: a -> a -> a
-- : max :: a -> a -> a

--  Tous les types de base sont des instances de cette classe de type.   les listes et les tuples aussi si les type de leurs éléments  sont instance de cette classe.


('a', 10) < ('a', 100)



-- #+RESULTS:
-- : True


[1,2,3] > [0,20,4,32]



-- #+RESULTS:
-- : True

-- Notez que les listes et tuples sont rangées comme dans un dictionnaire, en comparant l'ordre des éléments  un par un.


('a','b') < ('a', 10)

-- Show --  les types que l'on peut afficher
--  Cette classe contient tous les types dont les valeurs peuvent être convertis en chaîne de caractères avec la méthode suivante:

-- #+RESULTS:
-- : show :: a -> String

-- - exemples :

show [1,2,3]



-- #+RESULTS:
-- : [1,2,3]


show ('a', False)

-- Read --  les types que l'on peut lire
--  cette classe contient tous les types qui  supporte la méthode suivante
-- #+RESULTS:
-- : read :: String -> a


read "False" :: Bool



-- #+RESULTS:
-- : False


read "[1,2,3]" :: [Int]



-- #+RESULTS:
-- : [1,2,3]


read "123" :: Int



-- #+RESULTS:
-- : 123


--  ici nous aidons ghci  à inférer le type du résultat avec  la notation ':: a'.   en pratique le type peut être fait automatiquement à partir du contexte.


not (read "False")

-- Num --  les types numériques
--  nous avons déjà vu,  ce sont tous les types qui supportent les six méthodes suivantes :

-- #+RESULTS:
-- : (+) :: a -> a -> a
-- : (-) :: a -> a -> a
-- : (*) :: a -> a -> a
-- : negate :: a -> a
-- : abs :: a -> a
-- : signum :: a -> a

--  Les types de base, Int, Integer, Float and Double  sur les instances de la classe Num.

signum (-3)

-- Fractional
--  ce sont les types numériques mais qui en plus supporte les 2 méthodes suivantes:
-- #+RESULTS:
-- : (/) :: a -> a -> a
-- : recip :: a -> a


:doc recip

-- Le recyclage c'est bon
--  la façon la plus simple de faire des fonctions et d'utiliser  d'anciennes fonctions

impair :: Integral a => a -> Bool
impair n = n `mod` 2 == 0

séparer :: Int -> [a] -> ([a],[a])
séparer = n xs = (take n xs, drop n xs)

inverse :: Fractional a => a -> a
inverse n = 1/n

-- Expressions conditionnelle

abs' :: Int -> Int
abs' n = if n >= 0 then n else -n

signum' :: Int -> Int
signum' n = if n < 0 then 
                -1
            else
                if n == 0 then
                    0
                else
                    1

-- Gardes
--  A la place des expressions conditionnelles,  on peut utiliser des équations gardées /guarded equations/.   c'est une fuite d'expression logique qui permettent de choisir la séquence suivante.   c'est la première expression logique (guarde)  bonsoir c'est vrai alors c'est sa broche qui sera choisi c'est la seconde alors c'est sur la seconde branche et ainsi de suite.


abs'' n | n >= 0 = n
        | otherwise = -n



-- '|'  se lit 'tel que'.

--  l'avantage des gardes est qu'ils clarifient le code.


signum'' n | n < 0 = -1
           | n == 0 = 0
           | otherwise = 1

-- Motif (/pattern matching/)
--  Beaucoup de fonctions ont des définitions intuitive et simple qui peuvent être construite en utilisant une suite de motifs,  qui est un peu comme pour les gardes permettent de choisir quelle branche suivre dans la définition de la fonction.


et :: Bool -> Bool -> Bool
True `et` True = True
True `et` False = False
False `et` True = False
False `et` False = False



-- Cette définition peut être simplifiée en rassemblant les trois dernières expressions grâce au joker '_'  qui remplace n'importe quelle valeur


et :: Bool -> Bool -> Bool
True `et` True = True
_ `et` _ = False

-- motifs de tuple
--  On peut aussi utiliser des tuples comme motif  de sélection.

premier :: (a,b) -> a
premier (a,_) = a

-- motifs de liste

-- la même technique s'applique pour les listes.   Un motif de liste avec une taille donnée  sélectionnera toutes les listes de cette taille.


test :: [Char] -> Bool 
test ['a',_,_] = True
test _ = False



-- Ce /test/ renverra vrai pour toutes les listes d'exactement trois éléments commençant par 'a'.

-- On peut aussi utiliser un motif qui utilise l'opérateur /cons/ ':' qui permet de construire une liste


1 :  [2,3]  == [1,2,3]



-- #+RESULTS:
-- : True

-- qu'il ne faut pas confondre avec  opérateur de concaténation '++'


[1] ++ [2,3] == [1,2,3]



-- #+RESULTS:
-- : True

--  Voici deux exemples d'utilisation.


head2 :: [a] -> a
head2 (x:_) = x

tail2 :: [a] -> [a]
tail2 (_:xs) = xs

-- Expressions lambda

-- Il existe aussi un moyen de définir des fonctions sans leur donner de nom.

\x -> x + x


-- est la fonction qui prend une variable x et renvoie son double.


(\x -> x + x) 3



-- #+RESULTS:
-- : 6

--  le nombre de variables on peut prendre pas limité, exemple :

\x -> (\y -> x + y)


-- c'est l'écriture lambda de la fonction ajouter

-- Ce type de notation est souvent utile dans les définitions à portée locale.   par exemple au lieu d'écrire

impaires :: Int -> [Int]
impaires n = map f [0..n-1]
             where f x = x*2 +1


-- pour définir la fonction qui génèrent les premiers nombres impairs,  il peut écrire

impaires' :: Int -> [Int]
impaires' map (\x -> x*2 +1) [0..n-1]

-- Listes en compréhension
--  En mathématiques, une liste en compréhension est une liste définie en filtrant une autre liste.  Par exemple ${x^2 | x \in [1\cdot 5]}$ est la liste des carrés des 5 premiers entiers notée en compréhension.

-- Haskell permet ce type de définition

[x^2 | x <- [1..5 ]]



-- #+RESULTS:
-- : [1,4,9,16,25]

--  Un autre exemple avec deux générateurs

[(x,y) | x <- [1,2,3],  y <- "aB"]



-- #+RESULTS:
-- : [(1,'a'),(1,'B'),(1,'c'),(1,'d'),(2,'a'),(2,'B'),(2,'c'),(2,'d'),(3,'a'),(3,'B'),(3,'c'),(3,'d')]


[(x,y) | y <- "aB", x <- [1,2,3]]

-- Filtres /Guards/

diviseurs_de :: Int -> [Int]
diviseurs_de n = [x | x <- [1..n], n `mod` x == 0]

-- Exemple avec zip
-- Zip est une fonction qui crée une liste de paires en prenant deux les éléments dans deux listes différentes jusqu'à épuisement de  l'une d'elles.


zip "abcd" [1..10]



-- #+RESULTS:
-- : [('a',1),('b',2),('c',3),('d',4)]



paires :: [a] -> [(a,a)]
paires xs = zip xs (tail xs)

paires [1..5]



-- #+RESULTS:
-- : [(1,2),(2,3),(3,4),(4,5)]


est_triée :: Ord a => [a] -> Bool 
est_triée xs = and [x <= y | (x,y)  <- paires xs]

est_triée [1,2,3,10,5]

-- Concepts de bases
--  Une fonction récurcive et une fonction qui s'appelle elle-même. on peut redéfinir la fonction vectorielle les chapitres précédents comme suit:

factorielle :: Int -> Int
factorielle 0 = 1
factorielle x = x * factorielle (x - 1)

-- Récursion  et listes
--  Voici d'autres exemples avec des liste comme paramètre


produit :: Num a => [a] -> a
produit [] = 0
produit (n:ns) = n * produit ns

longueur :: [a] -> Int
longueur [] = 0
longueur (_:xs) = 1 + longueur xs

renverse :: [a] -> [a]
renverse [] = []
renverse (x:xs) = reverse xs ++ [x]

-- Exemples avec plusieurs paramètres
-- Une fonction qui fait comme le zip

coupler :: [a] -> [b] -> [(a,v)]
coupler [] _ = []
coupler _ [] = []
coupler (x:xs) (y:ys) = (x,y) : coupler xs ys


-- Une fonction qui supprime les n premiers éléments d'une liste.

décapiter :: Int -> [a] -> [a]
décapiter 0 xs = xs
décapiter _ [] = []
décapiter n (_:xs) = décapiter (n-1) xs

-- Récursion multiple
--  Une fonction peut s'appeler elle-même plusieurs fois,  par exemple pour construire la suite de fibonacci : 

fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-2) + fibo (n-1)

tri_rapide :: Ord a => [a] -> [a]
tri_rapide [] = []
tri_rapide (x:xs) = tri_rapide plus_petits ++ [x] ++ tri_rapide plus_grands
                    where 
                      plus_petits = [a | a <- xs, a <= xs]
                      plus_grands = [b | b <- xs, b > xs]

-- Récursion mutelle

est_paire :: Int -> Bool 
est_paire 0 = True
est_paire n = est_impaire (n-1)

est_impaire :: Int -> Bool
est_impaire 1 = True
est_impaire n = est_paire (n-1)

indices_paires :: [a] -> [a]
indices_paires [] = []
indices_paires (x:xs) = x : indices_impaires xs

indices_impaires :: [a] -> [a]
indices_impaires [] = []
indices_impaires (_:xs) = indices_paires xs

-- définir le type de la fonction

produit :: [Int] -> Int

-- identifier les cas importants

produit [] = 
produit (n:ns) =

-- écrire la définition de cas simples

produit [] = 1
produit (n:ns) =

-- écrire la définition des autres cas

produit [] = 1
produit (n:ns) = n * produit ns

-- généraliser et simplifier

produit :: Num a => [a] -> a



-- on va voir dans le prochain chapitre que ce type de définition est inclus dans une fonction appelée /foldr/.   on peut donc définir la fonction produit  en une ligne

produit = foldr (*) 1

-- fold
-- - foldr : appelée reduce dans d'autre language,  applique un opérateur sur une liste en allant de la droite à la gauche.

longueur :: [a] -> Int
longueur = flodr (\_ n -> 1 +n) 0

-- composition
-- l'opérateur (.) permet de simplifier et de clarifier le code à la place de 

impaire n = not (paire n)
repéter f x = f (f x)
somme_carré_positif ns = sum (map (^2) (filter paire ns))


-- on écrira

impaire  = not . pair
répeter = f . f
somme_carré_positif = sum . map (^2) . filter pair

-- type
-- On peut les définir comme des synonymes de types existant

type Position = (Int, Int)
type Transistion = Pos -> Pos


-- les types récursifs sont interdits


type Arbre = (Int, [Tree]) --interdit



-- Par contre on peut utiliser les classe de type

type Paire a = (a,a)
type Dico k v = [(k,v)]

-- data

data Déplacement = Nord | Sud | Est | Ouest deriving Show

déplace :: Déplacement -> Position -> Position
déplace North (x,y) = (x,y+1)
déplace Sud (x,y) = (x, y-1)
déplace Est (x,y) = (x+1,y)
déplace Ouest (x,y) = (x-1,y)



-- Avec des variables et des paramètres

data Forme = Cercle Float | Rectangle Float Float

faire_carré :: Float -> Forme
faire_carré n = Rectangle n n

faire_cercle :: Float -> Forme
faire_cercle r = Cercle r

calculer_aire :: Forme -> Float
calculer_aire (Rectangle long larg) = long * larg
calculer_aire (Cercle r) = pi * r^2



-- Les constructeur Cercle et Rectangle sont des fonctions constructeur à cause de leurs variable

:t Cercle



-- #+RESULTS:
-- : Cercle :: Float -> Forme


data Maybe a = Nothing | Just a

division_securisée :: Int -> Int -> Maybe Int
division_securisée _ 0 :: Nothing
division_securisée m n = Just (m `div` n)

-- newtype
--  dans les cas simple et pour des questions de sécurité et de performance on peut aussi utiliser newtype pour déclarer un nouveau type

newtype Entier_Naturel = N Int

-- types récursifs


data Naturel = Zero | Succ Naturel deriving Show
data Arbre a = Feuille a | Noeud (Arbre a) a (Arbre a) deriving Show

-- Classes

-- Voici comment on déclare un classe de type en Haskell

class Eq a where 
    (==), (/=) :: a -> a -> Bool 

    x /= y = not (x==y)


-- et comment on instancie cette classe de type

instance Eq Bool where
    False == False = True 
    True  == True  = True 
    _ == _ = False

// Programmation fonctionnelle
//  C'est un style de programmation qui met en avance l'utilisation des fonctions.  Haskell  est un langage fonctionnel parce qu'il encourage ce type de programmation.

// Java, C++, python  sont des généralement langages  /impératifs/. On y définit *comment* doivent se faire les calculs. 
//  Voici comment on calcul la somme des entiers de 1 à n  langages impératif et fonctionnel.


int total = 0;
for (int count = 1; count <= 1; count ++)
    total = total + count;

# GHCi : Glasgow Haskell Compilater Interactif 
#   Il nous faut un éditeur de texte et un compilateur Haskell.

#    Prenez l'éditeur que vous voulez.   Concernant le compilateur nous allons utiliser le plus commun qui s'appelle [[https://www.haskell.org/downloads/][Glasgow Haskell Compilater (GHC)]].  suivez le lien les instructions pour l'installer.  


#    Cependant nous allons utiliser la version interactive du compilateur qui s'appelle ghci.

mlk@teur ~ $ ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
Prelude>



# On peu compiler test.hs avec la commande

ghc --make test.hs


# Mais ce programme ne fait que définir deux fonctions.   Il n'affiche rien, et ne demande rien à l'utilisateur.
# il est plus pratique de l'ouvrir avec ghci  comme suit:


ghci test.hs

> :reload
[1 of 1] Compiling Main             ( test.hs, interpreted )
Ok, one module loaded.

> factorielle 10
3628800



# Des commandes importantes de ghci a connaître sont :
# - :l ou :load /fichier/-> charge un module
# - :r ou :reload /fichier/ -> recharge un module qui vien d'être modifié
# - :q ou :quit -> sort du ghci
# - :t ou :type /objet/ -> connaître le type d'un objet
# - :doc /fonction/ -> avoir la documenation d'une fonction
# - :i ou :info /objet/-> avoir des information
# - :? ou :help -> affiche l'aide de ghci
# - :browse /module/ -> montre tous les définitions chargées en mémoire


> :doc head
 Extract the first element of a list, which must be non-empty.
