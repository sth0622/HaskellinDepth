module Lib
    ( someFunc
    ) where

import Data.Char ( isLetter )
import Data.List (group, sort)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

someFunc :: IO ()
someFunc = do
    text <- TIO.readFile "./src/hamlet.txt"
    let ws = map head $ group $ sort $ map T.toCaseFold $ filter (not . T.null) $ map (T.dropAround $ not . isLetter) $ T.words text
    TIO.putStrLn $ T.unwords ws
    print $ length ws
