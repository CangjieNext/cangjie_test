// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.little, user.cmp.arch.big }
package cmp

import cmp.most_common_pkg.commonFunc
import cmp.override.*
import cmp.jump_override.*
import cmp.platformAOnlyPkg.*
import cmp.platformBOnlyPkg.*

public specific func foo(): Unit {
    jumpOverride()
    fromFeatureSet()
    commonFunc("very specific foo")
    println("Very specific call")
}

public func mergePlatfromOnlyCalls() {
    platformAOnlyPkgFunc()
    platformBOnlyPkgFunc()
}