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
public class Param_C1 {
    public init(a: Son, b!: Son, c!: Son = Son()) {
    }
    protected init(a: Son, b: Son, c: Son, d: Father) {
    }
}
public class Param_C2 {
    const init(a: Son, b!: Son = Son(), c!: Son = Son()) {
    }
    public const func getC2(a: Son) {
        Param_C2(a)
    }
}
public class Param_C3 {
    public var v1: Int64 = 1
    init(a: Son, b!: Son = Son(), c!: Son = Son()) {
        this.v1 = 1
    }
    @Frozen
    public func getC3(a: Son) {
        Param_C3(a)
    }
}

