/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

import std.random.*

public struct Pair<T, U> {
    let x: T
    let y: U
    public init(a: T, b: U) {
        x = a
        y = b
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

public struct Pair1<T, U> where T <: ToString, U <: Random {
    let x: T
    let y: U
    public init(a: T, b: U) {
        x = a
        y = b
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

 struct Pair2<T, U> where T <: Random {
    let x: T
    let y: U
    public init(a: T, b: U) {
        x = a
        y = b
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

struct S2<T, U> where T <: Random, U <: Random {
    let s1: Int64 = 0
}

public struct Pair15 {
    let x: S2<Random, Random> = S2<Random, Random>()
}

struct S3<T, U> where T <: Random, U <: Random{
    let x: Int64 = 0
    public const init() {}
}


public struct Pair3 {

    public const init() {}
    public const func getX(): Int64 {

        let x: S3<Random, Random> = S3<Random, Random>()
        return x.x
    }

}

struct S12<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair18 {
    let x: S12<Random, Int64> = S12<Random, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
}



