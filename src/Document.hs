data Document =
    { path :: String
    , content :: String
    , numOfCharacters :: Int
    , numOfLetter :: [Int]
    , numOfWords :: Int
    , numOfUniqueWords :: Int
    , specificWord :: String
    , numOfSpecificWord :: Int
    , numOfLines :: Int
    , numOfLongLines :: Int
    } deriving (Show)
