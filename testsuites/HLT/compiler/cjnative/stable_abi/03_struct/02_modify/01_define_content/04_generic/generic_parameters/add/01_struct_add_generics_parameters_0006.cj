/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.4.1
  @Scene: add
  @Visibility: used in public @Frozen declare
  @Object: struct
  @Behavior: add generic parameters
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Added generic param of struct visible outside the module.
// ASSERT: scan-1 [API/ABI] Modified member variables' type for struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]

// test struct: add generics
// 新增泛型参数的名称
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

public struct Pair2<T, U> where T <: Random {
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

public struct Pair3<T, U> {
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

struct S1<W> {
    let s1: Int64 = 0
}

public struct Pair4 {
    let x: S1<Int64> = S1<Int64>()
}

struct S2<W, T> {
    let s2: Int64 = 0
}

public struct Pair5 {
    let x: S2<Int64, Int64> = S2<Int64, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s2
    }
}

public struct Pair6<T, U, W> {
    let x: T
    let y: U
    let z: W
    public init(a: T, b: U, c: W) {
        x = a
        y = b
        z = c
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
    public func third(): W {
        return z
    }
}

struct S3<W, T> {
    let s1: Int64 = 0
}

public struct Pair7 {
    let x: S3<Int64, Int64> = S3<Int64, Int64>()
}

struct S4<W, T> {
    let s2: Int64 = 0
}

public struct Pair8 {
    let x: S4<Int64, Int64> = S4<Int64, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s2
    }
}

public struct Pair9<T, U> {
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

struct S5<W, T> {
    let s1: Int64 = 0
}

public struct Pair10 {
    let x: S5<Float64, Int64> = S5<Float64, Int64>()
}

struct S6<W, T> {
    let s2: Int64 = 0
}

public struct Pai11 {
    let x: S6<Float64, Int64> = S6<Float64, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s2
    }
}

public struct Pair12<T, U> where T <: Random {
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

struct S7<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair13 {
    let x: S7<Random, Int64> = S7<Random, Int64>()
}

struct S8<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair14 {
    let x: S8<Random, Int64> = S8<Random, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
}

struct S9<T, U> where T <: Random, U <: Random {
    let s1: Int64 = 0
}

public struct Pair15 {
    let x: S9<Random, Random> = S9<Random, Random>()
}

struct S10<T, U> where T <: Random, U <: Random {
    let s1: Int64 = 0
}

public struct Pair16 {
    let x: S10<Random, Random> = S10<Random, Random>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
}

struct S11<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair17 {
    let x: S11<Random, Int64> = S11<Random, Int64>()
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

struct S13<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair19 {
    let x: S13<Random, Int64> = S13<Random, Int64>()
}

struct S14<T, U> where T <: Random {
    let s1: Int64 = 0
}

public struct Pair20 {
    let x: S14<Random, Int64> = S14<Random, Int64>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
}
