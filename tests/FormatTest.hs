module FormatTest
    ( formatSpecs
    ) where

import Import
import Yesod.Test

formatSpecs :: Specs
formatSpecs =
  describe "These are some example tests" $
    it "loads the index and checks it looks right" $ do
      get_ "/format/2"
      statusIs 200
      htmlAllContain "h1" "Hello"

      post "/" $ do
        addNonce
        fileByLabel "Choose a file" "tests/main.hs" "text/plain" -- talk about self-reference
        byLabel "What's on the file?" "Some Content"

      statusIs 200
      htmlCount ".message" 1
      htmlAllContain ".message" "Some Content"
      htmlAllContain ".message" "text/plain"
