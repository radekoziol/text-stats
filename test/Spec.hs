import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)
import Utils
import qualified Document

main :: IO ()
main = defaultMain unitTests

unitTests =
  testGroup "TEXT-STATS HUnit tests" [testSplitToWords1, testSplitToWords2,
                                      testCountOccurrence1,
                                      testWordOccurence1,
                                      testCountAsciiOccurrence1,
                                      testGetPath1,
                                      testGetContent1,
                                      testGetLines1,
                                      testGetWords1,
                                      testGetUniqueWords1,
                                      testGetFreqWords1]

testSplitToWords1 =
  testCase "Test splitting #1" $ assertEqual [] ["Akademia", "Gorniczo-Hutnicza"] (splitToWords "Akademia Gorniczo-Hutnicza")

testSplitToWords2 =
  testCase "Test splitting #2" $ assertEqual [] ["Katedra", "informatyki", ".", ".", "."] (splitToWords "Katedra informatyki . . .")

testCountOccurrence1 =
  testCase "Test counting occurrence #1" $ assertEqual [] 3 (countOccurrence "x" ["x", "x", "x", "X"])

testWordOccurence1 =
  testCase "Test counting occurrence #1" $ assertEqual [] [(1,"The"),
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
  testCase "Test counting ASCII #1" $ assertEqual [] 4 (countAsciiOccurrence 65 "ALA MA KOTA")

testGetPath1 =
  testCase "Test getting path #1" $ assertEqual [] "path.txt" (Document.getPath $ Document.MkDocument "path.txt" "content")

testGetContent1 =
  testCase "Test getting content #1" $ assertEqual [] "content" (Document.getContent $ Document.MkDocument "path.txt" "content")

testGetLines1 =
  testCase "Test counting lines #1" $ assertEqual [] 2 (Document.getLines $ Document.MkDocument "path.txt" "content\ncontent")

testGetWords1 =
  testCase "Test counting words #1" $ assertEqual [] 5 (Document.getWords $ Document.MkDocument "path.txt" "content\ncontent even more content")

testGetUniqueWords1 =
  testCase "Test counting unique words #1" $ assertEqual [] 3 (Document.getUniqueWords $ Document.MkDocument "path.txt" "content\ncontent even more content")

testGetFreqWords1 =
  testCase "Test counting frequency of words #1" $ assertEqual [] [(3,"content")] (Document.getFreqWords $ Document.MkDocument "path.txt" "content\ncontent even more content")
