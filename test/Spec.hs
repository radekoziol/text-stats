import Test.Tasty (defaultMain, testGroup)

import UtilsSpec
import DocumentSpec

main :: IO ()
main = defaultMain unitTests

unitTests =
  testGroup "TEXT-STATS HUnit tests" $ testsUtilsSpec ++ testsDocumentSpec
