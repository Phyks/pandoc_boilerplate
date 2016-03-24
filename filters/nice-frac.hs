-- nice-frac.hs

import Text.Pandoc.JSON
import Text.Regex

-- Usefull regex elements
space :: String
space = "[ \\t\\n\\r]*"
num :: String
num = "([0-9]+)"

-- Replace fractions like "(42 / 1)" by "\frac{42}{1}" 
fracReg :: Regex
fracReg = mkRegex $
  "\\(" ++ space ++ num ++ space ++ "/" ++ space ++ num ++ space ++ "\\)"
frac :: String -> String
frac s = subRegex fracReg s "\\\\frac{\\1}{\\2}"

-- Apply the substitution to all Latex parts on the AST
niceFrac :: Inline -> Inline
niceFrac (Math t s) = Math t (frac s)
niceFrac x = x

main :: IO ()
main = toJSONFilter niceFrac

