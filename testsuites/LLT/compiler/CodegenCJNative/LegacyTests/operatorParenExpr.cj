// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

struct A {
    public let a: Int32
    public init(a: Int32) {
        this.a = a
    }
    public func add(inputA: A, inputB: A): A {
        var output = A(inputA.a + inputB.a)
        return output
    }
    public operator func +(inputB: A): A {
        var output = A(this.a + inputB.a)
        return output
    }
}

interface D {
    operator func +(inputB: D): Int32 {
        return 0
    }
}

class C <: D {
    public let a: Int32
    public static func add(inputA: C, inputB: C): C {
        var output = C(inputA.a + inputB.a)
        return output
    }
    public operator func +(inputB: C): C {
        var output = C(this.a + inputB.a)
        return output
    }
    public init(a: Int32) {
        this.a = a
    }
}

func codegenUnitTest(): Int32 {
    var a = A(1)
    var b = A(-1)
    var a1 = C(1)
    var b1 = C(-1)
    var a2: D = C(1)
    var b2: D = C(-1)
    var val = ((a.add(a, b))).a + ((C.add(a1, b1))).a + ((a + b)).a + ((a1 + b1)).a + (a2 + b2)
    var b3 = a.add(a, b)
    val = val + (b3).a
    var b4 = (a + b)
    val = val + (b4).a
    return (a.add(a, b)).a + (C.add(a1, b1)).a + (a + b).a + (a1 + b1).a + (a2 + b2) + val
}

main(): Int64 {
    return Int64(codegenUnitTest())
}
