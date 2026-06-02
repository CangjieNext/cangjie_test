// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {
    func f(): Int64
}

open class A <: I1 {
    public open func f(): Int64 {
        0
    }
}

class B <: A {
    public override func f(): Int64 {
        1
    }
}

func testInf(ins: I1) {
    ins.f()
}

main() {
    var insA = A()
    var insB = B()
    var a = testInf(insA)
    var b = testInf(insB)
    if (a != 0 || b != 1) {
        return 1
    }
    return 0
}
