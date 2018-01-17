import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)
import Utils

main :: IO ()
main = defaultMain unitTests

unitTests =
  testGroup
    "splitToWords tests"
    [splitToWords1]

splitToWords1 =
  testCase "Split Akademia Gorniczo-Hutnicza" $ assertEqual [] ["Akademia", "Gorniczo-Hutnicza"] (splitToWords "Akademia Gorniczo-Hutnicza")
