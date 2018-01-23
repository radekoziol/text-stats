module Utils
  (
    splitToWords
  , countOccurrence
  , wordOccurence
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

-- For every word [how_many_times_it_occured,word]
wordOccurence :: String -> [(Int, String)]
wordOccurence text = map (\str -> (countOccurrence str (words text), str)) (nub $ words text)

countAsciiOccurrence :: Int -> String -> Int
countAsciiOccurrence ascii xs = length [x | x <- xs, fromEnum x == ascii || fromEnum x == ascii + 32]
