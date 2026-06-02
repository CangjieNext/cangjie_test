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
    var r1 = Coo()
    if (r1.a3 != 8) {
        return 1
    }
    var r2 = Coo(1)
    if (r2.a3 != 4) {
        return 2
    }
    if (r2.a5 != 5) {
        return 3
    }
    return 0
}

open class Boo {
    public static var s1: Int32 = 1
    public var s2: Int64 = 1
}

class Coo <: Boo {
    public var a0 = 0
    public static var a1 = 1
    public var a3: Int32
    public let a4 = 2
    public let a5: Int32

    public init() {
        a3 = 1
        a5 = 2
        var b = {=> this.a0 + 1 + this.a4 + super.s2} // b is Int64
        var c = {=> a3 + 1 + a5} // c is Int32
        a3 = Int32(b()) + c()
    }
    public init(y: Int32, x!: (Int32) -> Int32 = {x: Int32 => x + 1 + Int32(a1) + s1}) { // s1 is not super.s1,s1 is a static variable
        a3 = x(1)
        a5 = x(2)
    }
}
