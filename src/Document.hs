module Document
  ( Document(..)
  , getLines
  , getWords
  , getUniqueWords
  , getFreqWords
  , getChars
  , getLettersOcc
  , getWordOcc
  , getLongLines
  ) where

import Utils
import Data.List

data Document = MkDocument
  {
    getPath :: String
  , getContent :: String
  } deriving Show


-- |The 'getLines' fucntion calculates number of lines in given document
-- It takes one argument, of type Document and returns Int
getLines :: Document -> Int
getLines (MkDocument path content) = length $ lines content

getWords :: Document -> Int
getWords (MkDocument path content) = length [x | x <- words content]

getUniqueWords :: Document -> Int
getUniqueWords (MkDocument path content) = length $ group $ sort $ words content

-- Returns word if it at least duplicated
getFreqWords :: Document -> [(Int, String)]
getFreqWords (MkDocument path content) = filter (\(int, str) -> int > 1) (wordOccurence content)

getChars :: Document -> Int
getChars (MkDocument path content) = length content

getLettersOcc :: Document -> [Int]
getLettersOcc (MkDocument path content) = loop 65 [] content
  where loop 91 result _                = result
        loop ascii result content       = loop (ascii + 1) (result ++ [countAsciiOccurrence ascii content]) content

getWordOcc :: Document -> String -> Int
getWordOcc (MkDocument path content) word = length [x | x <- words content, x == word]

getLongLines :: Document -> Int -> Int
getLongLines (MkDocument path content) n = loop 0 0 n content
  where loop result _ _ []               = result
        loop result acc n (x:xs)         = if x == '\n' then
                                             if acc > n then loop (result + 1) 0 n xs
                                             else loop result 0 n xs
                                           else loop result (acc + 1) n xs
