{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Main where

import Import
import Settings
import Yesod.Default.Config
import Yesod.Test
import Application (makeFoundation)

import HomeTest
import FormatTest

main :: IO ()
main = do
    conf <- loadConfig $ (configSettings Testing) { csParseExtra = parseExtra }
    foundation <- makeFoundation conf 
    app <- toWaiAppPlain foundation
    runTests app (connPool foundation) homeSpecs
    runTests app (connPool foundation) formatSpecs
