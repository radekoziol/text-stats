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
import qualified Document
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
readInput = do
  args <- getArgs
  case args of
      [path, word, lineLen] -> do
        content <- readFile path
        let doc = Document.MkDocument path content
        let x = read lineLen :: Int
        putStrLn ("File path: " ++ (show $ Document.getPath doc))
        putStrLn ("Lines: " ++ (show $ Document.getLines doc))
        putStrLn ("Words: " ++ (show $ Document.getWords doc))
        putStrLn ("Unique words: " ++ (show $ Document.getUniqueWords doc))
        putStrLn ("Words fregquency: " ++ (show $ Document.getFreqWords doc))
        putStrLn ("Chars: " ++ (show $ Document.getChars doc))
        putStrLn ("Letters occurrency: " ++ (show $ Document.getLettersOcc doc))
        putStrLn ("Word '" ++ word ++ "' occurred: " ++ (show $ Document.getWordOcc doc word))
        putStrLn ("Lines longer than " ++ lineLen ++ ": " ++ (show $ Document.getLongLines doc x))
      _ -> do
        name <- getProgName
        putStrLn $ "usage: " ++ name ++ " <path> <word>"

noSuchFileEx :: IOError -> IO ()
noSuchFileEx = \ex -> if isDoesNotExistError ex
                then putStrLn "File doesn't exist!"
                else ioError ex
