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

  
{-|
  The 'getLines' function returns number of lines in given document.
  It takes one argument, of type Document and returns Int
-}
getLines :: Document -> Int
getLines (MkDocument path content) = length $ lines content

{-|
  The 'getWords' function returns number of words in given document
  It takes one argument, of type Document and returns Int
-}
getWords :: Document -> Int
getWords (MkDocument path content) = length [x | x <- words content]

{-|
  The 'getWords' function returns number of non-repetetive words in given document
  It takes one argument, of type Document and returns Int
-}
getUniqueWords :: Document -> Int
getUniqueWords (MkDocument path content) = length $ words content

{-|
  The 'getWords' function returns a map of frequently used words [how_many_times_word_occured,word].
  We define frequently as at least duplicated.
  It takes one argument, of type Document and returns map of Int and String.
-}
getFreqWords :: Document -> [(Int, String)]
getFreqWords (MkDocument path content) = filter (\ (int,str) -> int > 1) (wordOccurrence content)

{-|
  The 'getChars' function returns a number of chars used in document.
  It takes one argument, of type Document and returns map of Int.
-}
getChars :: Document -> Int
getChars (MkDocument path content) = length content

{-|
  The 'getLettersOcc' function returns 
  It takes one argument, of type Document and returns an array of Ints.
-}
getLettersOcc :: Document -> [Int]
getLettersOcc (MkDocument path content) = loop 65 [] content
  where loop 91 result _                = result
        loop ascii result content       = loop (ascii + 1) (result ++ [countAsciiOccurrence ascii content]) content

{-|
  The 'getWordOcc' function counts occurence of given word in document.
  It takes two arguments, of type Document and of type String and returns Int.
-}        
getWordOcc :: Document -> String -> Int
getWordOcc (MkDocument path content) word = length [x | x <- words content, x == word]

{-|
  The 'getLongLines' function 
  It takes two arguments, of type Document and of type Int and returns Int.
-}        
getLongLines :: Document -> Int -> Int
getLongLines (MkDocument path content) n = loop 0 0 n content
  where loop result _ _ []               = result
        loop result acc n (x:xs)         = if x == '\n' then
                                             if acc > n then loop (result + 1) 0 n xs
                                             else loop result 0 n xs
                                           else loop result (acc + 1) n xs
