// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Testcase for interface call
interface I1 {
    func inf1(): Int64 {
        return 1
    }

    func inf2(): Int64 {
        return 4
    }
}

open class A <: I1 {
    public open func inf1(): Int64 {
        return 2
    }
    public open func inf2(): Int64 {
        return 4
    }
}

class B <: A & I1 {
    public override func inf1(): Int64 {
        return 3
    }

    public override func inf2(): Int64 {
        return 5
    }
}

func test(i1: I1): Int64 {
    return i1.inf1()
}

func test2(i1: I1): Int64 {
    return i1.inf2()
}

main() {
    var insA = A()
    var insB = B()
    var a = test(insA)
    var b = test(insB)
    var c = test2(insA)
    var d = test2(insB)
    if (a != 2 || b != 3 || c != 4 || d != 5) {
        return 1
    }
    return 0
}
