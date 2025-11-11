/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember variable
open public class Father {
    const init() {}
}

public class Son <: Father {
    const init() {}
}

public class CC {
    public let a1: Int8 = 1
    public var a2: Int32 = 2

    protected let c1: Int8 = 1
    protected var c2: Int32 = 2
}

open class baseClass {
    public let a1: Int8 = 1
    public var a2: Int32 = 2

    protected let c1: Int8 = 1
    protected var c2: Int32 = 2
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public let a1: Int8 = 1
    public var a2: Int32 = 2

    protected let c1: Int8 = 1
    protected var c2: Int32 = 2
}


public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(c.a1, 1)
    assert(c.a2, 2)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 2
    assert(c.a2, 2)
    assert(c.c1, 1)
    assert(c.c2, 2)
    c.c2 = 22
    assert(c.c2, 22)
    c.c2 = 2
    assert(c.c2, 2)

    let 
}