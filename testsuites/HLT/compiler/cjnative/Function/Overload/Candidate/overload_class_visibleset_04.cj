/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public let base_a: Int32 = 1
    public open func bar(x: Int32): Int64 {
        1
    }
}

class A <: Base {
    public let a: Int32 = 2
    public func foo(x: Int32): Int64 {
        this.bar(this.a)
    }
    public override func bar(x: Int32): Int64 {
        Int64(x + 2)
    }
}

struct Data {
    public let d1: Int32
    public let d2: Int32
    public init(x: Int32) {
        this(x, x + 1)
    }
    public init(x: Int32, y: Int32) {
        d1 = x
        d2 = d1 + y
    }
    public init(x: String, y: Int32) {
        d1 = y + 1
        d2 = d1 + y + 2
    }
}

main(): Int64 {
    var res1 = A().foo(1)
    var res2 = Data(2)
    if (res1 == 4 && res2.d1 == 2 && res2.d2 == 5) {
        return 0
    }
    return 1
}
