{-# OPTIONS_GHC -fno-warn-type-defaults #-}
module Main where

import Prelude
import Control.Concurrent (threadDelay)

import Boards
import Utils
import Rules

main :: IO ()
main = do putStrLn "Hello World of Haskell"

runLife :: Board -> IO()
runLife b = do cls
               showcells b
               threadDelay 40000
               runLife $ nextgen b
