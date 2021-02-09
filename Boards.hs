module Boards where

import Rules

-- STILL LIFES
block :: Board
block = [(10,2),(11,2),(10,3),(11,3)]

beehive :: Board
beehive = [(10,6),(11,6),(9,7),(12,7),(10,8),(11,8)]

loaf :: Board
loaf = [(10,11),(11,11),(9,12),(12,12),(10,13),(12,13),(11,14)]

boat :: Board
boat = [(10,18),(11,18),(10,19),(12,19),(11,20)]

tub :: Board
tub = [(10,23),(9,24),(11,24),(10,25)]

-- OCILLATORS
blinker :: Board
blinker = [(20,3),(20,4),(20,5)]

toad :: Board
toad = [(20,9),(21,9),(22,9),(21,10),(22,10),(23,10)]

penta :: Board -- pentadecathlon
penta = [(20,14),(20,16),(19,17),(21,17),(20,18),(20,19),(20,20),(20,21),(19,22),(21,22),(20,23),(20,24)]

-- SPACESHIPS
glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

lwss :: Board
lwss = [(2,11),(5,11),(6,12),(2,13),(6,13),(3,14),(4,14),(5,14),(6,14)]

-- METHUSELAHS
rpentomino :: Board
rpentomino = [(60,30),(61,30),(60,31),(60,32),(59,31)]

diehard :: Board
diehard = [(60,30),(59,30),(60,31),(65,29),(64,31),(65,31),(66,31)]

-- GUNS
glidergun :: Board
glidergun = [ (2,7),(3,7),(2,8),(3,8),
              (14,5),(15,5),(13,6),(17,6),(12,7),(18,7),(12,8),(16,8),(18,8),(19,8),(12,9),(18,9),(13,10),(17,10),(14,11),(15,11),
              (26,3),(26,4),(24,4),(22,5),(22,6),(22,7),(23,5),(23,6),(23,7),(24,8),(26,8),(26,9),
              (36,5),(37,5),(36,6),(37,6) ]

-- PUFFER | puffer trains
pufferOne :: Board
pufferOne = mkBoard 0 20 $ reverse pufferOne'

pufferOne' :: [String]
pufferOne' =
  [ ".OOO......O.....O......OOO",
    "O..O.....OOO...OOO.....O..O",
    "...O....OO.O...O.OO....O",
    "...O...................O",
    "...O..O.............O..O",
    "...O..OO...........OO..O",
    "..O...OO...........OO...O" ]

-- rake
spaceRake :: Board
spaceRake = mkBoardFlipped 40 0 spaceRake'

spaceRake' :: [String]
spaceRake' =
  [ "...........OO.....OOOO",
    ".........OO.OO...O...O",
    ".........OOOO........O",
    "..........OO.....O..O",
    "",
    "........O",
    ".......OO........OO",
    "......O.........O..O",
    ".......OOOOO....O..O",
    "........OOOO...OO.OO",
    "...........O....OO",
    "",
    "",
    "",
    "..................OOOO",
    "O..O.............O...O",
    "....O................O",
    "O...O............O..O",
    ".OOOO" ]

--
---
----
mkBoard :: Int -> Int -> [String] -> Board
mkBoard offsetX offsetY sss =
  concat [ [ (x,y) | (y,s) <- enumerate ss offsetY, isO s  ] | (x,ss) <- enumerate sss offsetX ]

mkBoardFlipped :: Int -> Int -> [String] -> Board
mkBoardFlipped offsetX offsetY sss =
  concat [ [ (y,x) | (y,s) <- enumerate ss offsetY, isO s  ] | (x,ss) <- enumerate sss offsetX ]

enumerate :: [a] -> Int -> [(Int,a)]
enumerate xs offset = zip [offset..] xs

isO :: Char -> Bool
isO c = c == 'O'
