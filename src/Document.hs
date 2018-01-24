{-|
Module      : Document
Description : Document detailed description
Copyright   : (c) Radosław Kozioł, 2018
                  Piotr Kardaś, 2018
License     : GPL-3
Maintainer  : pkardas.it@gmail.com
Stability   : experimental
Portability : POSIX

 This module is result of more a object-oriented programming approach.
 We wanted to make easier comparing documents.
-}
module Document
  ( Document(..)
  , countLines
  , countWords
  , countUniqueWords
  , countFreqWords
  , countChars
  , countLettersOcc
  , countWordOcc
  , countLongLines
  ) where

import Utils
import Data.List

data Document = MkDocument
  {
-- | The 'getPath' function returns full path to file.
    getPath :: String
-- | The 'getContent' function returns content of document.
  , getContent :: String
  } deriving Show

{-|
  The 'countLines' function returns number of lines in given document.
  It takes one argument, of type Document and returns Int
-}
countLines :: Document -> Int
countLines (MkDocument path content) = length $ lines content

{-|
  The 'countWords' function returns number of words in given document
  It takes one argument, of type Document and returns Int
-}
countWords :: Document -> Int
countWords (MkDocument path content) = length [x | x <- words content]

{-|
  The 'countWords' function returns number of non-repetetive words in given document
  It takes one argument, of type Document and returns Int
-}
countUniqueWords :: Document -> Int
countUniqueWords (MkDocument path content) = length . group . sort . words $ content

{-|
  The 'countWords' function returns a map of frequently used words [how_many_times_word_occured,word].
  We define frequently as at least duplicated.
  It takes one argument, of type Document and returns map of Int and String.
-}
countFreqWords :: Document -> [(Int, String)]
countFreqWords (MkDocument path content) = filter (\ (int,str) -> int > 1) (wordOccurrence content)

{-|
  The 'countChars' function returns a number of chars used in document.
  It takes one argument, of type Document and returns map of Int.
-}
countChars :: Document -> Int
countChars (MkDocument path content) = length content

{-|
  The 'countLettersOcc' function counts how many each letter has appeared.
  It takes one argument, of type Document and returns an array of Ints.
-}
countLettersOcc :: Document -> [Int]
countLettersOcc (MkDocument path content) = loop 65 [] content
  where loop 91 result _                = result
        loop ascii result content       = loop (ascii + 1) (result ++ [countAsciiOccurrence ascii content]) content

{-|
  The 'countWordOcc' function counts occurence of given word in document.
  It takes two arguments, of type Document and of type String and returns Int.
-}
countWordOcc :: Document -> String -> Int
countWordOcc (MkDocument path content) word = length [x | x <- words content, x == word]

{-|
  The 'countLongLines' function calculates how many are there lines longer than <arg>.
  It takes two arguments, of type Document and of type Int and returns Int.
-}
countLongLines :: Document -> Int -> Int
countLongLines (MkDocument path content) n = loop 0 1 n content
  where loop result _ _ []               = result
        loop result acc n (x:xs)         = if x == '\n' then
                                             if acc > n then loop (result + 1) 0 n xs
                                             else loop result 0 n xs
                                           else loop result (acc + 1) n xs
