module UtilsSpec(testsUtilsSpec) where

import Test.Tasty.HUnit (assertEqual, testCase)
import Utils

testCountOccurrence1 =
  testCase "Test counting occurrence #1" $ assertEqual []
  3
  (countOccurrence "x" ["x", "x", "x", "X"])

testWordOccurence1 =
  testCase "Test counting occurrence #1" $ assertEqual []
  ([(2,"the"),
   (1,"glorious"),
   (1,"glasgow"),
   (1,"haskell"),
   (1,"compilation"),
   (1,"system"),
   (2,"version"),
   (1,"8.2.2"),
   (1,"-"),
   (1,"best")])
  (wordOccurrence "The Glorious Glasgow Haskell Compilation System, version 8.2.2 - the best version")

testCountAsciiOccurrence1 =
  testCase "Test counting ASCII #1" $ assertEqual []
  4
  (countAsciiOccurrence 65 "ALA HAS CAT")

testRemovePunctation1 =
  testCase "Test removing punctation #1" $ assertEqual []
  "cat"
  (removePunctuation "cat,")

testRemoveNonAlpha1 =
  testCase "Test removing non-alpha #1" $ assertEqual []
  ["A","cat","has","a","big","beautiful","eyes"]
  (removeNonAlpha "A cat has a big, beautiful eyes.")

testLowerStrings1 =
  testCase "Test lowering strings #1" $ assertEqual []
  ["a","cat","has","a","big","beautiful","eyes"]
  (lowerStrings ["A","cat","has","a","big","beautiful","eyes"])

testsUtilsSpec = [testCountOccurrence1,
                  testWordOccurence1,
                  testCountAsciiOccurrence1,
                  testRemovePunctation1,
                  testRemoveNonAlpha1]
