import Test.QuickCheck
-- usage: ghci Tests.hs

main = do
  quickCheck prop_reverseReverse

prop_reverseReverse :: [Int] -> Bool
prop_reverseReverse xs = reverse (reverse xs) == xs
