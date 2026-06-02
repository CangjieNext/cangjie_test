/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkgs

main(): Int64 {
    var a = A()
    if (a.goo() != 12) {
        return 1
    }
    return 0
}

func foo(a: Int64, fn: (Int64) -> Int64) {
    return fn(a)
}

class A {
    public var a: Int32 = 1
    public func foo(a: Int64, fn: (Int64) -> Int64) {
        return fn(a) + 1
    }
    public func goo() {
        return foo(1, {x: Int64 => x + 1}) + foo(1, {x: Int64 => x + 1}) + foo(1) {x: Int64 => x + 1} +
            foo(1) {x: Int64 => x + 1}
    }
}
