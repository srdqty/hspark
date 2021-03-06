-- |
-- Module : Spark.Context
--
-- Context defines the stratum on which the distributed process will
-- be based.

module Spark.Context where

import Control.Distributed.Process
import Control.Distributed.Static

data Strategy = Distributed { masterNode :: NodeId
                            , slaveNodes :: [NodeId] }

-- | Context for creating spark workflow.
-- Defines the context for processing RDD tasks. The context stores
-- list of peers (slaves) where the tasks can be run. The peers, in
-- the context of Distributed.Process are nodes on which tasks can
-- run. 
data Context = Context { _lookupTable :: RemoteTable
                       , _strategy :: Strategy
                       }

-- | Creates context from slave nodes

createContextFrom :: RemoteTable -> NodeId -> [NodeId] -> IO Context
createContextFrom rt master = return . Context rt . Distributed master
                 
-- | Creates the context.
-- Note that there can only one context in the given cluster. This
-- is not enforced yet, and creationg more than one context is not
-- tested either.




