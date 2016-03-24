-- usual-fun.hs

import Text.Pandoc.JSON
import Text.Regex
import Data.List (intercalate)

-- Association list for usual functions
usual :: String
usual = intercalate "|" [
  "cos", "sin", "tan", "cotan",
  "arccos", "arcsin", "arctan",
  "exp", "log"]  

-- Remove the '\' before usual functions' names if present
rmBSReg :: Regex
rmBSReg = mkRegex $ "(\\\\)(" ++ usual ++ ")\\>"
rmBS :: String -> String
rmBS s = subRegex rmBSReg s "\\2"

-- Add a '\' before usual functions' names
addBSReg :: Regex
addBSReg = mkRegex $ "\\<(" ++ usual ++ ")\\>"
addBS :: String -> String
addBS s = subRegex addBSReg s "\\\\\\0"

-- Apply the substitution to all Latex parts on the AST
niceFrac :: Inline -> Inline
niceFrac (Math t s) = Math t (addBS . rmBS $ s)
niceFrac x = x

main :: IO ()
main = toJSONFilter niceFrac

