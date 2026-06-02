// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class BaseClass {
    public var a: Int32 = 100
    public func add(i: Int32): Int32 {
        return a + i
    }
    public func virtualMethod(i: Int32): Int32 {
        let x: Int32 = 15
        func sum(y: Int32): Int32 {
            var sum1 = {
                y: Int32 => return add(x)
            }
            return sum1(0);
        }
        return sum(1)
    }
    public init(a: Int32) {
        this.a = a
    }
}

func classTest(): Int32 {
    let obj: BaseClass = BaseClass(1000)
    return obj.virtualMethod(100)
}

func codegenUnitTest(): Int32 {
    return classTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1015) {
        return 0
    } else {
        return -1
    }
}

struct R {
    public let y: Int32 = 0
    public func Forward(x: Int32) {
        let f = {x1: Int32 => x1 + y}
        return f(x)
    }
}
