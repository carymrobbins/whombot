{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Java
import System.Environment

main = do
  args <- getArgs
  putStrLn "Welcome to whombot!"
  putStrLn $ "Arguments supplied: " ++ show args
  props <- loadPropertiesFromFile "lib/edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger.props"
  tagger <- java $ newMaxentTagger "lib/edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger" props
  let sample = "This is a sample text"
  let out = tagString tagger sample
  putStrLn out

loadPropertiesFromFile :: String -> IO Properties
loadPropertiesFromFile path = java $ do
  props <- newProperties
  is <- newFileInputStream path
  loadProperties props is
  return props

foreign import java unsafe "@new" newProperties :: Java a Properties

foreign import java unsafe "load" loadProperties
  :: (is <: InputStream )
  => Properties -> is -> Java a ()

data {-# CLASS "java.io.InputStream" #-} InputStream
  = InputStream (Object# InputStream)
  deriving Class

data {-# CLASS "java.io.FileInputStream" #-} FileInputStream
  = FileInputStream (Object# FileInputStream)
  deriving Class

type instance Inherits FileInputStream = '[InputStream]

foreign import java unsafe "@new" newFileInputStream :: String -> Java a FileInputStream

data {-# CLASS "edu.stanford.nlp.tagger.maxent.MaxentTagger" #-} MaxentTagger
  = MaxentTagger (Object# MaxentTagger)
  deriving Class

foreign import java unsafe "@new" newMaxentTagger :: String -> Properties -> Java a MaxentTagger
foreign import java unsafe "tagString" tagString :: MaxentTagger -> String -> String
