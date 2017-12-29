module Stats
  (
    countLines,
    countWords,
    countChars,
    countLinesLongerThan,
    countWordOccurrence,
    countAsciiOccurrence,
    countLettersOccurrence,
    countUniqueWords,
    splitToWords
  ) where

import Data.Char
import Data.List

-- Splits string at ' '
splitToWords :: String -> [String]
splitToWords [] = [""]
splitToWords (x:xs)
   | x == ' ' = "" : rest
   | otherwise = (x : head rest) : tail rest
   where
       rest = splitToWords xs

-- Splitting into list of words, then removing duplicates, returns num of elements in list
-- Filtering "" because splitToWords function split preciesly at ' ', what causes "" to appear at some cases
-- (consider splitToWords " " -> ["",""])
countUniqueWords:: String -> Int
countUniqueWords text = length $ filter (\x -> x /= "") $ nub $ splitToWords text


countLines :: String -> Int
countLines content = length $ lines content


countWords :: String -> Int
countWords xs = length [x | x <- words xs] -- działa chyba

-- Every duplicating word is counted
frequentlyUsedWords :: String -> [(Int,String)]
frequentlyUsedWords text = map (\ str -> ( countOccurence str (splitToWords text) ,str)) (filter (\x -> x /= "") $ nub $ splitToWords text)

countOccurence :: Eq a => a -> [a] -> Int
countOccurence x = length . filter (x==)

countChars :: String -> Int
countChars x = length x

countAsciiOccurrence :: Int -> String -> Int
countAsciiOccurrence ascii xs = length [x | x <- xs, fromEnum x == ascii || fromEnum x == ascii + 32]

countLettersOccurrence :: String -> String
countLettersOccurrence = loop 65 "Letters - "
  where loop 90 result xs = result ++ [toEnum 90] ++ ": " ++ show (countAsciiOccurrence 90 xs)
        loop ascii result xs = loop (ascii + 1) (result ++ ([toEnum ascii] ++ ": " ++ show (countAsciiOccurrence ascii xs) ++ ", ")) xs

-- (dodać obsługę błędów)
countWordOccurrence :: String -> String -> Int
countWordOccurrence word xs = length [x | x <- words xs, x == word]

--nie wiem co ja tworze XDD
countLinesLongerThan :: Int -> String -> Int
countLinesLongerThan n = loop 0 0 n
  where loop result _ _ [] = result
        loop result acc n (x:xs) = if x == '\n' then
                                      if acc > n then loop (result + 1) 0 n xs
                                      else loop result 0 n xs
                                   else loop result (acc + 1) n xs
