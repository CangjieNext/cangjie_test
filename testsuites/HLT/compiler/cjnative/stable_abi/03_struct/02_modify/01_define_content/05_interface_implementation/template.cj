/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

open class Base {}

public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

interface Multiplicable {
    func add(other: Int64): Int64
}

public struct MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
}

public struct DeleteI1 <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
}

struct S1 {
    let x: Int64 = 0
}

public struct DeleteI2 <: Addable & Subtractable {
    let x: S1 = S1()
    var value = 0

    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
    public func getX(): Int64 {
        return x.x
    }
}

struct S3 {
    let x: Int64 = 0
}

public struct DeleteI3 <: Addable & Subtractable {
    let x: S3 = S3()
    var value = 0

    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
    public func getX(): Int64 {
        return x.x
    }
}

public struct MofifyI1 <: Addable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
}

struct S4 {
    let x: Int64 = 0
}

public struct MofifyI2 <: Addable {
    var value = 0
    let x: S4 = S4()

    public func add(other: Int64): Int64 {
        value + other
    }

    public func getX(): Int64 {
        return x.x
    }
}

struct S5 {
    let x: Int64 = 0
}

public struct MofifyI3 <: Addable {
    var value = 0
    let x: S5 = S5()

    public func add(other: Int64): Int64 {
        value + other
    }

    public func getX(): Int64 {
        return x.x
    }
}
