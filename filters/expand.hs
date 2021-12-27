#!/usr/bin/env runhaskell
{-# LANGUAGE OverloadedStrings #-}
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
 | y == ";;Q" = Str ("Expanded ;;Q") : expand' ys
 | y == ";;QE" = Str ("Expanded ;;QE") : expand' ys
 | y == ";;A" = Str ("Expanded ;;A") : expand' ys
 | y == ";;AE" = Str ("Expanded ;;AE") : expand' ys
 | otherwise = Str y : expand' ys
expand' (y:ys) = y : expand' ys
