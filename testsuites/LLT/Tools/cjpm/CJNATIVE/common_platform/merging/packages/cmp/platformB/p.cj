// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.little }
package cmp

import std.random.*
import cmp.override.*
import cmp.jump_override.*
import cmp.most_common_pkg.*
import cmp.platformBOnlyPkg.*

public specific func foo(): Unit {
    println("Platform B 'foo'")
}

public func goo() {
    jumpOverride()
    fromFeatureSet()
    platformBOnlyPkgFunc()
    commonFunc("goo")
    print("call from goo:")
    foo()
}
