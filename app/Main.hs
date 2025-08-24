module Main where

import System.Environment (getArgs)
import Text.Regex.Posix ((=~))

main :: IO ()
main = do
  args <- getArgs

  case args of
    [pattern, file] -> do
      content <- readFile $ file
      let found = filter (=~ pattern) $ lines content
      mapM_ putStrLn found
    _ -> putStrLn "USAGE: <pattern> <file>"

