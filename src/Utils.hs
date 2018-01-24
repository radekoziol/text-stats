{-|
Module      : Utils
Description : Contains functions connected with document
Copyright   : (c) Radosław Kozioł, 2018
                  Piotr Kardaś, 2018
License     : GPL-3
Maintainer  : pkardas.it@gmail.com
Stability   : experimental
Portability : POSIX

-}
module Utils
  ( countOccurrence
  , wordOccurrence
  , countAsciiOccurrence
  , removePunctuation
  , removeNonAlpha
  , lowerStrings
  ) where

import Data.Char
import Data.List

{-|
  The 'countOccurrence' function counts occurence of some element in an array of elements.
  In our project it is used to split text into words.
  It takes two arguments, one is counted element of some type, other an array of thos types and return Int.
-}
countOccurrence :: Eq a => a -> [a] -> Int
countOccurrence x = length . filter (x == )

{-|
  The 'removePunctuation' function removes in a string a comma or dot, placed at the end of string.
  Note that it is assumed that any given text will follow those rules.
  It takes one arguments, of type String and returns String.
-}
removePunctuation :: String -> String
removePunctuation x
        | (last x == '.' || last x == ',') = init x
        | otherwise                        = x

{-|
  The 'removeNonAlpha' function for each word in text removes it's punctuation in order to
  count occurence of the same word - consider string "abc, abc."
  It takes one arguments, of type String and returns an array of Strings.
-}
removeNonAlpha :: String -> [String]
removeNonAlpha x = map (\x -> removePunctuation x) (words x)

{-|
  The 'lowerStrings' returns string in lower case.
  It takes one arguments, of type an array of Strings and returns an array of Strings.
-}
lowerStrings :: [String] -> [String]
lowerStrings x = map (\x -> map toLower x) x

{-|
  The 'wordOccurence' function returns for a text, a map of [how_many_times_word_occured,word]
  For each word in a set of processed text (in lower case, excluded punctuation), occurence is counted.
  It takes one arguments, of type of String and returns a map of Int and String.
-}
wordOccurrence :: String -> [(Int, String)]
wordOccurrence text = map (\str -> (countOccurrence str processedtext, str)) (nub $ processedtext)
      where processedtext = lowerStrings $ removeNonAlpha text

{-|
  The 'countAsciiOccurrence' function counts occurence of some ascii symbol in given string.
  It takes two arguments, one is ascii element of type Int, second of type String, returns Int.
-}
countAsciiOccurrence :: Int -> String -> Int
countAsciiOccurrence ascii xs = length [x | x <- xs, fromEnum x == ascii || fromEnum x == ascii + 32]
