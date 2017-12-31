module FileReader
  ( readInput,
    noSuchFileEx
  ) where

import System.Environment
import System.IO.Error
import Control.Exception
import Control.Monad
import Data.Char
import Data.List
import Stats
import Document

-- Zadania:
-- Napisać program obliczający dla podanego pliku następujęce wskaźniki:
-- liczbę linii, OK
-- liczbę wyrazów, OK
-- liczbę znaków, OK
-- liczbę różnych wyrazów OK
-- liczbę linii o długości większej niż 80 znaków OK
-- Dodać do programu obsługę błędów (co najmniej: nieprawidłowa liczba argumentów wywołania,
-- nieistniejący plik wejściowy)
-- Napisać program obliczający liczbę wystąpień zadanego słowa w pliku (dodać obsługę błędów)
-- Zmodyfikować funkcję exHdlr: zamianst predykatu isDoesNotExistError (i wyrażenia warunkowego)
-- użyć IOErrorType i mechanizmu dopasowania wzorców
-- Przeanalizować zawartość Control.Exception i System.IO.Error

-- ile dana litera wysapiła w tekscie
-- najczesciej uzyte slowo

readInput :: IO ()
readInput = do (fileName:otherArg) <- getArgs
               when (otherArg /= []) $ error "Too many arguments!"
               when (map toUpper fileName == "HELP") $ putStrLn "Usage: $ .. FULLPATH"
               contents <- readFile fileName
               putStrLn ("Number of characters: " ++ show (countChars contents))
               putStrLn ("Number of words: " ++ show (countWords contents))
               putStrLn ("Number of lines: " ++ show (countLines contents))
               putStrLn ("Number of unique words: " ++ show (countUniqueWords contents))
               putStrLn ("Number of lines longer than 80: " ++ show (countLinesLongerThan 80 contents))
               putStrLn ("Number of 'xD': " ++ show (countWordOccurrence "xD" contents))
               putStrLn ("Letters occurrence: " ++ show (countLettersOccurrence contents))




noSuchFileEx :: IOError -> IO ()
noSuchFileEx = \ex -> if isDoesNotExistError ex
                then putStrLn "File doesn't exist!"
                else ioError ex

                -- readInput :: IO ()
                -- readInput = do (fileName:otherArg) <- getArgs
                --                when (otherArg /= []) $ error "Too many arguments!"
                --                when (map toUpper fileName == "HELP") $ putStrLn "Usage: $ .. FULLPATH"
                --                contents <- readFile fileName
                --                putStrLn ("Number of characters: " ++ show (countChars contents))
                --                putStrLn ("Number of words: " ++ show (countWords contents))
                --                putStrLn ("Number of lines: " ++ show (countLines contents))
                --                putStrLn ("Number of unique words: " ++ show (countUniqueWords contents))
                --                putStrLn ("Number of lines longer than 80: " ++ show (countLinesLongerThan 80 contents))
                --                putStrLn ("Number of 'xD': " ++ show (countWordOccurrence "xD" contents))
                --                putStrLn ("Letters occurrence: " ++ show (countLettersOccurrence contents))
                --
