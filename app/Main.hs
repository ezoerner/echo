module Main where

main :: IO ()
main = do
  ln <- getLine
  putStrLn $ "Got: " ++ ln