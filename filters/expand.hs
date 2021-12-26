#!/usr/bin/env runhaskell
-- expand.hs

import Text.Pandoc.JSON
import Data.Text

main :: IO ()
main = toJSONFilter expand

expand :: Block -> Block
expand (Para xs) = Para (expand' xs)
expand xs        = xs 

expand' :: [Inline] -> [Inline]
expand' [] = []
expand' ((Str y):ys)
 | unpack y == ";;Q" = Str (pack "Expanded ;;Q") : expand' ys
 | unpack y == ";;QE" = Str (pack "Expanded ;;QE") : expand' ys
 | unpack y == ";;A" = Str (pack "Expanded ;;A") : expand' ys
 | unpack y == ";;AE" = Str (pack "Expanded ;;AE") : expand' ys
 | otherwise = Str y : expand' ys
expand' (y:ys) = y : expand' ys
