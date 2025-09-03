/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/bbb/b_01.cj -o bbb.%middle
// EXEC: %compiler %cmp_opt src/aaa/%f bbb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

import bbb.foo
import bbb

main(): Int64 {
    var coo = COO(1)
    var a = coo.call()
    if (a != 2 || coo.res != 2) {
        return 1
    }
    return 0
}

public func foo(x: Int32) {
    return 1
}

public func foo(x: Int64) {
    return 2
}

public func foo(x: Int64, y: String) {
    return 3
}

public func foo(x: Int64, y: Rune) {
    return 4
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String)
}

class COO {
    public func foo(x: Int32) {
        return 11
    }

    public func foo(x: Int64) {
        return 12
    }

    public func foo(x: Int64, y: String) {
        return 13
    }
    public var res: Int32 = 1
    public init() {}
    public init(x: Int32) {
        this()
        var a = foo(1) // call foo(x:Int64) in oneself(class COO)
        var b = TimeUnit.foo(1) // call foo from Enum

        var d = foo(1, r'a') // call foo from top-level
        var e = bbb.foo(1) // call foo from  other package
        var f = match (b) {
            case _ => 0
        }
        if (a != 12 || d != 4 || e != 20 || f != 0) {
            res--
        } else {
            res++
        }
    }
    public func call() {
        var a = foo(1) // call foo(x:Int64) in oneself(class COO)
        var b = TimeUnit.foo(1) // call foo from Enum

        var d = foo(1, r'a') // call foo from top-level
        var e = bbb.foo(1) // call foo from  other package
        var f = match (b) {
            case _ => 0
        }
        if (a != 12 || d != 4 || e != 20 || f != 0) {
            return 1
        }
        return 2
    }
}
