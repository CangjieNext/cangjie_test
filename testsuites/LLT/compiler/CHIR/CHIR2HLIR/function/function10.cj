// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not unimplemented generate for 'This' type!
internal import std.collection.*

var b = 1

class A {
    func foo() {
        b++
    }
}

var a = ArrayList<A>()

main() {
    a.add(A())
    var x = ArrayList<Unit>()
    x.add(a.get(0).getOrThrow().foo())

    if (b == 2) {
        return 0
    }

    return 1
}
