{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
module BlogList where

import Database.MongoDB
import Control.Monad.Trans (liftIO)
import Control.Monad.IO.Class
import Data.Either
--import Data.Text
import Data.Time



dbName = "Chernobog"

getPipe :: IO Pipe
getPipe = runIOE $ connect (host "127.0.0.1")

run :: Control.Monad.IO.Class.MonadIO m => Pipe -> Action m a -> m (Either Failure a)
run pipe = access pipe master dbName

curTime = do
    tm <- getZonedTime
    return (zonedTimeToUTC tm)

insertArticle pipe = do 
    tm <- curTime
    run pipe $ insert "article" ["title" =: "A test Article I am playing around with",
                    "date" =: tm,
                    "content" =: "a bit of content"]
                    
getArticleList pipe = do
    run pipe $ rest =<< find (select [] "article") 
    
getArticleTitles pipe = do
    run pipe $ rest =<< find (select [] "article") {project = ["title" =: 1] }
    
deleteArticleById pipe id = do
    run pipe $ delete $ select ["_id" =: id] "article"
    
deleteArticleByTitle pipe title = do
    run pipe $ delete $ select ["title" =: title] "article"

