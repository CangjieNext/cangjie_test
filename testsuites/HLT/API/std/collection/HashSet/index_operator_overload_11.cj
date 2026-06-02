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

// index的参数类型
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

    public operator func [](index: Float64, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: Int32, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: String, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: Bool, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: Array<Int64>, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: HashSet<Int64>, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: (Int32, Int32), value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: (Int32) -> Int32, value!: Int64): Unit {
        this.b = value
    }
    /**
    operator func []( index: Range<Int64>, value!: Int64): Unit{
        this.b = value
    }
     */
    public operator func [](index: A, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: B, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: I, value!: Int64): Unit {
        this.b = value
    }
    public operator func [](index: Time, value!: Int64): Unit {
        var a = match (index) {
            case _ => 4
        }
        this.b = value
    }
    public operator func [](index: Unit, value!: Int64): Unit {
        this.b = value
    }
}

main(): Int64 {
    var a = A(2)
    a[2.1] = 1
    a[3] = 2
    a["hello"] = 3
    a[true] = 4
    a[[1, 2, 3]] = 5
    // a[(1,2)] = 7  // 编译报错
    a[B()] = 8
    a[Time.Day] = 9
    a[A(2)] = 10
    a[()] = 11
    // a[{a:Int32=>a}] = 12
    if (a.b == 11) {
        return 0
    }
    return 1
}
