/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: constructors--init Constructors
open public class Father {
    public const init() {}
}
public class Son <: Father {
    public const init() {}
}
public class Public_C {
    public var v1: Int64 = 1
    public init() {
    }

    public init(a: Int64) {
        this.v1 = a
    }
}
open class Param_C1 {
    public init() {}
    public init(a: Father, b!: Father, c!: Father = Father()) {
    }
    protected init(a: Father, b: Father, c: Father, d: Father) {
    }
}
public class A <: Param_C1 {
    let a: Int64 = 20

    public init() {}
}

open class Param_C2 {
    public init() {}
    const init(a: Father, b!: Father = Father(), c!: Father = Father()) {
    }
    public const func getC2(a: Father) {
        Param_C2(a)
    }
}
public class B <: Param_C2 {
    let a: Int64 = 20

    public init() {}
}

open class Param_C3 {
    public init() {}
    public var v1: Int64 = 1
    init(a: Father, b!: Father = Father(), c!: Father = Father()) {
        this.v1 = 1
    }
    @Frozen
    public func getC3(a: Father) {
        Param_C3(a)
    }
}
public class C <: Param_C3 {
    let a: Int64 = 20

    public init() {}
}

