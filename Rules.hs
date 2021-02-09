module Rules where

import Prelude as P

--
type Pos = (Int, Int)
type Board = [Pos]

liveRule :: [Int]
liveRule = [2,3]

birthRule :: Int
birthRule = 3

isAlive :: Board -> Pos -> Bool
isAlive b p = p `elem` b

-- >>> isAlive [(5,5)] (5,5)
-- True

-- >>> isAlive [(5,5)] (5,6)
-- False

isDead :: Board -> Pos -> Bool
isDead b = not . isAlive b

neighbs :: Pos -> [Pos]
neighbs (x,y) =
          [ (x-1,y-1) ,(x,y-1),
            (x+1,y-1) ,(x-1,y),
            (x+1,y) ,(x-1,y+1),
            (x,y+1) ,(x+1,y+1) ]

liveneighbs :: Board -> Pos -> Int
liveneighbs b p = length $ filter (isAlive b) (neighbs p)

-- >>> liveneighbs [(5,5), (10,10)] (5,4)
-- >>> liveneighbs [(5,5), (6,5), (10,10)] (5,4)

survivors :: Board -> [Pos]
survivors b = [ p | p <- b,
                isAlive b p, -- TODO
                liveneighbs b p `elem` liveRule ]

-- >>> survivors  [(10,2),(11,2),(10,3),(11,3)]
-- >>> survivors  [(10,2)]

-- Intermission
rmdups' :: (Eq a) => [a] -> [a]
rmdups' [] = []
rmdups' (x:xs) = x : [ k | k <- rmdups' xs, k /= x ]

-- >>> rmdups' [1,2,3,3,4,1,2,3,4]
-- [1,2,3,4]

births :: Board -> [Pos]
births b = [ p | p <- rmdups' $ concatMap neighbs b,
             isDead b p,
             liveneighbs b p == birthRule
             ]

nextgen :: Board -> Board
nextgen b = survivors b ++ births b
