module Document
  ( Document(..)
  , getLines
  ) where

data Document = MkDocument
  {
    getPath :: String
  , getContent :: String
  } deriving Show

getLines :: Document -> Int
getLines (MkDocument path content) = length $ lines content
