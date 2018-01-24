module DocumentSpec(testsDocumentSpec) where

import Test.Tasty.HUnit (assertEqual, testCase)
import qualified Document

testGetPath1 =
  testCase "Test getting path #1" $ assertEqual []
  "path.txt"
  (Document.getPath $ Document.MkDocument "path.txt" "content")

testGetContent1 =
  testCase "Test getting content #1" $ assertEqual []
  "content"
  (Document.getContent $ Document.MkDocument "path.txt" "content")

testCountLines1 =
  testCase "Test counting lines #1" $ assertEqual []
  2
  (Document.countLines $ Document.MkDocument "path.txt" "content\ncontent")

testCountWords1 =
  testCase "Test counting words #1" $ assertEqual []
  5
  (Document.countWords $ Document.MkDocument "path.txt" "content\ncontent even more content")

testCountUniqueWords1 =
  testCase "Test counting unique words #1" $ assertEqual []
  3
  (Document.countUniqueWords $ Document.MkDocument "path.txt" "content\ncontent even more content")

testCountFreqWords1 =
  testCase "Test counting frequency of words #1" $ assertEqual []
  [(3,"content")]
  (Document.countFreqWords $ Document.MkDocument "path.txt" "content\ncontent even more content")

testCountChars1 =
  testCase "Test counting chars #1" $ assertEqual []
  26
  (Document.countChars $ Document.MkDocument "path.txt" "content\n even more content")

testCountLettersOcc1 =
  testCase "Test counting letters #1" $ assertEqual []
  [0,0,2,0,5,0,0,0,0,0,0,0,1,5,3,0,0,1,0,4,0,1,0,0,0,0]
  (Document.countLettersOcc $ Document.MkDocument "path.txt" "content\n even more content")

testCountWordOcc1 =
  testCase "Test counting words #1" $ assertEqual []
  2
  (Document.countWordOcc (Document.MkDocument "path.txt" "content\n even more content") "content")

testCountLongLines1 =
  testCase "Test counting long lines #1" $ assertEqual []
  1
  (Document.countLongLines (Document.MkDocument "path.txt" "content\n even more content") 7)

testsDocumentSpec = [testGetPath1,
                     testGetContent1,
                     testCountLines1,
                     testCountWords1,
                     testCountUniqueWords1,
                     testCountFreqWords1,
                     testCountChars1,
                     testCountLettersOcc1,
                     testCountWordOcc1,
                     testCountLongLines1]
