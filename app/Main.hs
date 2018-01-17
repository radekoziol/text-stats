module Main where

import System.Environment
import System.IO.Error
import Control.Exception

import FileReader


main :: IO ()
main = do
    result <- try readInput
    case result of
        Left ex -> noSuchFileEx ex
        Right _ -> putStrLn "Exit."
