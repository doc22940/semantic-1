module Control.Abstract.Context
( ModuleInfo
, PackageInfo
, currentModule
, withCurrentModule
, currentPackage
, withCurrentPackage
) where

import Control.Effect
import Control.Monad.Effect.Reader
import Data.Abstract.Module
import Data.Abstract.Package
import Prologue

-- | Get the currently evaluating 'ModuleInfo'.
currentModule :: (Effectful m, Member (Reader ModuleInfo) effects) => m effects ModuleInfo
currentModule = raise ask

-- | Run an action with a locally-replaced 'ModuleInfo'.
withCurrentModule :: (Effectful m, Member (Reader ModuleInfo) effects) => ModuleInfo -> m effects a -> m effects a
withCurrentModule = raiseHandler . local . const

-- | Get the currently evaluating 'PackageInfo'.
currentPackage :: (Effectful m, Member (Reader PackageInfo) effects) => m effects PackageInfo
currentPackage = raise ask

-- | Run an action with a locally-replaced 'PackageInfo'.
withCurrentPackage :: (Effectful m, Member (Reader PackageInfo) effects) => PackageInfo -> m effects a -> m effects a
withCurrentPackage = raiseHandler . local . const
