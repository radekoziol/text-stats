module Utils
  (
    splitToWords
  , countOccurrence
  , countAsciiOccurrence
  ) where

import Data.Char
import Data.List

splitToWords :: String -> [String]
splitToWords [] = [""]
splitToWords (x:xs)
   | x == ' '   = "" : rest
   | otherwise  = (x : head rest) : tail rest
   where
       rest = splitToWords xs

countOccurrence :: Eq a => a -> [a] -> Int
countOccurrence x = length . filter (x == )

countAsciiOccurrence :: Int -> String -> Int
countAsciiOccurrence ascii xs = length [x | x <- xs, fromEnum x == ascii || fromEnum x == ascii + 32]
