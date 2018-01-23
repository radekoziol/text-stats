module Utils
  (
    splitToWords
  , countOccurrence
  , wordOccurence
  , countAsciiOccurrence
  ) where

import Data.Char
import Data.List


countOccurrence :: Eq a => a -> [a] -> Int
countOccurrence x = length . filter (x == )

removePunctuation :: String -> String
removePunctuation x 
        | (last x == '.' || last x == ',') = init x
        | otherwise                        = x

removeNonAlpha :: [Char] -> [String]
removeNonAlpha x = map (\x -> removePunctuation x) (words x)

lowerStrings :: [String] -> [String]
lowerStrings x = map (\x -> map toLower x) x

-- For every word [how_many_times_it_occured,word]
wordOccurence :: String -> [(Int,String)]
wordOccurence text = map (\str -> (countOccurrence str processedtext, str)) (nub $ processedtext)
      where processedtext = lowerStrings $ removeNonAlpha text

countAsciiOccurrence :: Int -> String -> Int
countAsciiOccurrence ascii xs = length [x | x <- xs, fromEnum x == ascii || fromEnum x == ascii + 32]
