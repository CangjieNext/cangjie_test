// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default4testHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct4.cj"-38-9
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct4.cj"-41-9
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct4.cj"-44-9
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "struct4.cj"-45-9
// ASSERT: regex = Load\(%\d+\) // loc: "struct4.cj"-47-9

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

func test(cond: Bool) {
    var a = S(1.0, 1.0)
    if (cond) {
        foo(a)
        a.test()
    } else {
        foo(a)
        var b = S(2.0, 2.0)
        a = b
        foo(a)
        foo(a)
    }
    foo(a)
}

main() {
    test(true);
    0
}
