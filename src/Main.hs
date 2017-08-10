{-# LANGUAGE MagicHash #-}
module Main where

import Java
import System.Environment

main = do
  args <- getArgs
  putStrLn "Welcome to whombot!"
  putStrLn $ "Arguments supplied: " ++ show args
  -- tagger <- java $ newMaxentTagger "/edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger"
  tagger <- java $ newMaxentTagger "edu.stanford.nlp.models.pos-tagger.english-left3words.english-left3words-distsim.tagger"
  let sample = "This is a sample text"
  let out = tagString tagger sample
  putStrLn out

data {-# CLASS "edu.stanford.nlp.tagger.maxent.MaxentTagger" #-} MaxentTagger
  = MaxentTagger (Object# MaxentTagger)
  deriving Class

foreign import java unsafe "@new" newMaxentTagger :: String -> Java a MaxentTagger
foreign import java unsafe "tagString" tagString :: MaxentTagger -> String -> String
