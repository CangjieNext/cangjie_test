/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// value的参数类型
import std.collection.*

struct B {}

interface I {}

enum Time {
    Day
}

class A {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }

    public operator func [](index: Int64, value!: Float64): Unit {
        this.b = 1
    }
    public operator func [](index: Int64, value!: Int32): Unit {
        this.b = 2
    }
    public operator func [](index: Int64, value!: String): Unit {
        this.b = 3
    }
    public operator func [](index: Int64, value!: Bool): Unit {
        this.b = 4
    }
    public operator func [](index: Int64, value!: Array<Int64>): Unit {
        this.b = 5
    }
    public operator func [](index: Int64, value!: HashSet<Int64>): Unit {
        this.b = 6
    }
    public operator func [](index: Int64, value!: (Int32, Int32)): Unit {
        this.b = 7
    }
    public operator func [](index: Int64, value!: (Int32) -> Int32): Unit {
        this.b = 8
    }
    /**
    operator func []( index: Int64, value!: Range<Int64>): Unit{
        this.b = 9
    }
     */
    public operator func [](index: Int64, value!: A): Unit {
        this.b = 10
    }
    public operator func [](index: Int64, value!: B): Unit {
        this.b = 11
    }
    public operator func [](index: Int64, value!: I): Unit {
        this.b = 12
    }
    public operator func [](index: Int64, value!: Time): Unit {
        var a = match (value) {
            case _ => 4
        }
        this.b = 13
    }
    public operator func [](index: Int64, value!: Unit): Unit {
        this.b = 14
    }
}

main(): Int64 {
    var a = A(2)
    a[1] = 2.1
    a[2] = 3
    a[3] = "hello"
    a[4] = true
    a[5] = [1, 2, 3]
    // a[7] = (1,2)  // 编译报错
    a[8] = B()
    a[9] = Time.Day
    a[10] = A(2)
    // a[11] = {a:Int32=>a}
    a[11] = ()
    if (a.b == 14) {
        return 0
    }
    return 1
}
