import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)
import Utils

main :: IO ()
main = defaultMain unitTests

unitTests =
  testGroup "TEXT-STATS tests" [testSplitToWords1, testSplitToWords2,
                                testCountOccurrence1,
                                testWordOccurence1,
                                testCountAsciiOccurrence1]

testSplitToWords1 =
  testCase "Split Akademia Gorniczo-Hutnicza" $ assertEqual [] ["Akademia", "Gorniczo-Hutnicza"] (splitToWords "Akademia Gorniczo-Hutnicza")

testSplitToWords2 =
  testCase "Split Katedra informatyki . . ." $ assertEqual [] ["Katedra", "informatyki", ".", ".", "."] (splitToWords "Katedra informatyki . . .")

testCountOccurrence1 =
  testCase "Count occurrence of 'x'" $ assertEqual [] 3 (countOccurrence "x" ["x", "x", "x", "X"])

testWordOccurence1 =
  testCase "Count occurrence of words in 'The Glorious Glas...'" $ assertEqual [] [(1,"The"),
                                                                                       (1,"Glorious"),
                                                                                       (1,"Glasgow"),
                                                                                       (1,"Haskell"),
                                                                                       (1,"Compilation"),
                                                                                       (1,"System,"),
                                                                                       (2,"version"),
                                                                                       (1,"8.2.2"),
                                                                                       (1,"-"),
                                                                                       (1,"the"),
                                                                                       (1,"best")]
                                                                                       (wordOccurence "The Glorious Glasgow Haskell Compilation System, version 8.2.2 - the best version")

testCountAsciiOccurrence1 =
  testCase "Count ascii occurrence" $ assertEqual [] 4 (countAsciiOccurrence 65 "ALA MA KOTA")
