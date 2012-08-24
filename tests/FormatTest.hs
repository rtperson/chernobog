{-# LANGUAGE QuasiQuotes, TypeFamilies, GeneralizedNewtypeDeriving, FlexibleContexts #-}
{-# LANGUAGE TemplateHaskell, OverloadedStrings, GADTs, MultiParamTypeClasses #-}
module FormatTest
    ( formatSpecs
    ) where

import TestImport


formatSpecs :: Specs
formatSpecs =
  describe "These are some example tests" $
    it "loads the index and checks it looks right" $ do
      get_ "/format/2"
      statusIs 200
      bodyContains "Lorem ipsum"
      
  --}    
  



