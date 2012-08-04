{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Format where

import Import

-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
getFormatR :: Handler RepHtml
getFormatR = do
    defaultLayout $ do
        setTitle "Testing Chernobog Format"
        $(widgetFile "format")
        
getFormat2R :: Handler RepHtml
getFormat2R = do
    defaultLayout $ do
        setTitle "Example of Fixed Layout with Twitter Bootstrap version 2.0 from w3resource.com"
        $(widgetFile "format2")
        
topNav :: Widget
topNav = do
    $(widgetFile "top-nav")
    
leftNav :: Widget
leftNav = do
    $(widgetFile "left-nav")

blogContainer :: Widget
blogContainer = do
    $(widgetFile "blog-container")


    

