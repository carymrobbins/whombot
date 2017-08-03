module Main where

import System.Environment

main = do
  args <- getArgs
  putStrLn "Welcome to whombot!"
  putStrLn $ "Arguments supplied: " ++ show args

