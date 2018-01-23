module DocumentSpec(testsDocumentSpec) where

import Test.Tasty.HUnit (assertEqual, testCase)
import qualified Document

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

testsDocumentSpec = [testGetPath1,
                     testGetContent1,
                     testGetLines1,
                     testGetWords1,
                     testGetUniqueWords1,
                     testGetFreqWords1]
