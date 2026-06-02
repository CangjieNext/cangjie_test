// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {
    public func get(value: Int32): Int32 {
        return 1
    }
    public open func foo(): Int32 {
        return 10
    }
}

class B <: A {
    public func get(value: String): Int32 {
        return 100
    }
    public override func foo(): Int32 {
        return 1000
    }
}

func codegenUnitTest(): Int32 {
    var res: B = B()
    var obj: A = res
    var a = res.foo() + res.get(3) + res.get("hello") + obj.get(4) + obj.foo()
    return a
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 2102) {
        return 0
    } else {
        return -1
    }
}
