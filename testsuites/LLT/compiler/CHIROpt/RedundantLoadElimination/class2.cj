// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not Class-_CN7default1SE& = Load(
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "class2.cj"-37-5
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "class2.cj"-38-5
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "class2.cj"-44-5
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "class2.cj"-45-5

class S {
    var x: Float64
    var y: Float64

    init(x: Float64, y: Float64) {
        this.x = x
        this.y = y
    }

    public func test() {
        x * y
    }
}

func foo(s: S) {
    println(s.x)
}

main(): Int64 {
    var a = S(1.0, 1.0)
    foo(a)
    a.test()
    foo(a)
    foo(a)
    foo(a)
    var b = S(2.0, 2.0)
    a = b
    foo(a)
    foo(a)
    return 0
}
