{-# LANGUAGE OverloadedStrings #-}
module TestImport
    ( module Yesod.Test
    , selectList
    , SqlPersist
    , Key
    , Article
    , runDB
    , Specs
    ) where

import Yesod.Test
import Model
--import Database.Persist (selectList, Key)
import Database.Persist.MongoDB hiding (master)
import Database.Persist.GenericSql hiding (Connection)


type Specs = SpecsConn Connection

runDB :: Action IO a -> OneSpec Connection a
runDB = runDBRunner runMongoDBPoolDef
