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

main(): Int64 {
    var r1 = Coo().foo1()(2)
    if (r1 != 5) {
        return 1
    }
    var r2 = Coo().foo2()(2)
    if (r2 != 4) {
        return 1
    }
    return 0
}

open class Boo {
    public var s: Int32 = 1
}

class Coo <: Boo {
    public var a0 = 0
    public static var a1 = 1
    public var a3: Int32

    public init() {
        a3 = 1
    }
    public func foo1(x!: (Int32) -> Int32 = {x: Int32 => x + 1 + this.a3 + super.s}) {
        return x
    }
    public func foo2() {
        return {x: Int32 => x + 1 + super.s}
    }
}
