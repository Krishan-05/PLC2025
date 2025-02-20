module Main where

import Text.Printf

data Person
    = Person
        {
          person_name :: String
        }
    deriving (Eq)

instance Show Person where 
    show (Person name) = name 

data Item
    = Piece
        {
            item_name :: String,
            item_performer :: Person,
            item_length_secs :: Float
        }
    | Pause
        {
            item_length_secs :: Float
        }
    deriving (Eq)

instance Show Item where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name (show performer) len
    show (Pause len) =
        printf "Pause (%.1fs)" len

piece1 :: Item
piece1 =
    Piece
    { 
        item_name = "Moonlight Sonata",
        item_performer = Person "Claudio Arrau",
        item_length_secs = 17*60+26
    }

piece2 :: Item
piece2 =
    Piece
    { 
        item_name = "Moonlight Sonata",
        item_performer = Person "Daniel Barenboim",
        item_length_secs = 16*60+49
    }

pause1 :: Item
pause1 =
    Pause
    { 
        item_length_secs = 5
    }

sortTwoItems :: (Item, Item) -> (Item, Item)
sortTwoItems (item1, item2) = 
    if item_length_secs item1 <= item_length_secs item2
        then (item1, item2)
        else (item2, item1)

main :: IO ()
main = do
    let (shorterPiece, longerPiece) = sortTwoItems (piece1, piece2)
    putStrLn "piece1 and piece2 sorted by length:"
    putStrLn $ show shorterPiece
    putStrLn $ show longerPiece
    putStr "piece1 = "
    putStrLn $ show piece1
    putStr "pause1 = "
    putStrLn $ show pause1  -- Printing pause1
