/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    const init() {}

    public func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    private func g1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }
}

open class baseClass {
    const init() {}

    public func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    private func g1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    const init() {}

    public func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    private func g1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }
}


