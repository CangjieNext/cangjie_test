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
    if (Coo.b != 12) {
        return 1
    }
    if (Coo().c != 12) {
        return 2
    }
    if (Coo(1).c != 13) {
        return 2
    }
    if (Coo(1).d != 12) {
        return 3
    }
    return 0
}

class Coo {
    public static func foo(x: Int32) {
        return 11
    }

    public static func foo(x: Int64) {
        return 12
    }
    public func goo(x: Int32) {
        return 11
    }

    public func goo(x: Int64) {
        return 12
    }
    public var a: Int64 = 1
    public static var b = foo(1)
    public var c = foo(1)
    public var d = 1
    //var e = goo(1)
    //var f = this.goo
    public init() {}
    public init(x: Int32) {
        this()
        d = goo(1)
        c = foo(1) + 1
    }
}
