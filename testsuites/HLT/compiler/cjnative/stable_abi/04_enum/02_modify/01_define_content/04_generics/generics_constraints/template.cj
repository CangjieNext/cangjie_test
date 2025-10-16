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

public enum Pair<T, U> {
    | Red | Green | Blue(UInt8)
    public func first(x: T): T {
        return x
    }
    public func second(y: U): U {
        return y
    }
}

public enum Pair1<T, U> where T <: ToString, U <: Random {
    | Red | Green | Blue(UInt8)
    public func first(x: T): T {
        return x
    }
    public func second(y: U): U {
        return y
    }
}

public enum Pair2<T, U> where T <: Random {
    | Red | Green | Blue(UInt8)
    public func first(x: T): T {
        return x
    }
    public func second(y: U): U {
        return y
    }
}

public enum S7<T, U> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8<T, U> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9<T, U> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public class C1 {
    let v1 = S8<Random, Float64>.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9<Random, Float64>.Green
    }
}

