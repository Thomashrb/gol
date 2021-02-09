module Utils where

import Rules

cls :: IO ()
cls = putStr "\ESC[2J"

showcells :: Board -> IO()
showcells b = sequence_ [writeat p "O" | p <- b ]

-- >>> showcells glider

writeat :: Pos -> String -> IO()
writeat p xs = do goto p
                  putStr xs
  where goto (x,y) =
          putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")
