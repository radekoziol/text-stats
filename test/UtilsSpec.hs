module UtilsSpec(testsUtilsSpec) where

import Test.Tasty.HUnit (assertEqual, testCase)
import Utils

testCountOccurrence1 =
  testCase "Test counting occurrence #1" $ assertEqual [] 3 (countOccurrence "x" ["x", "x", "x", "X"])

testWordOccurence1 =
  testCase "Test counting occurrence #1" $ assertEqual [] ([(2,"the"),
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
  testCase "Test counting ASCII #1" $ assertEqual [] 4 (countAsciiOccurrence 65 "ALA MA KOTA")

testsUtilsSpec = [testCountOccurrence1,
                  testWordOccurence1,
                  testCountAsciiOccurrence1]
