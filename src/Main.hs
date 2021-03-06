{-# LANGUAGE FlexibleInstances #-}

import           FFMpegCommand
import           System.Environment
import           Utilities

main :: IO ()
main = do
  args <- getArgs
  if length args /= 4
    then dieWithMessage "Invalid arguments list"
    else generate args

generate :: [String] -> IO ()
generate args = do
  let [fileName, extension, commonParams, times] = args
  let command = generateCommand fileName extension commonParams (words times)
  maybe (dieWithMessage "Invalid time list") putStrLn command
