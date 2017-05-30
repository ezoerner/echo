module Main where

import System.IO
import Lib

main :: IO ()
main = do
  ln <- getLine
  putStrLn $ "Got: " ++ ln