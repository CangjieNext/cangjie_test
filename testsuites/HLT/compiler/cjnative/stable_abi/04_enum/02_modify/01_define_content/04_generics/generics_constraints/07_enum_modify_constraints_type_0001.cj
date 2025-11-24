/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.4.7
  @Scene: modify
  @Visibility: public | used in public const declare | used in public struct/class instance var
  @Object: enum
  @Behavior: modify generics constraints type
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [ABI] Changed generic constraint of enum visible outside the module.
// ASSERT: scan-3 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: modify generics
// 修改某个泛型参数的上界约束A为B，B是A的父类型
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

public enum S7<T, U> where T <: Object {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8<T, U> where T <: Object {
    | Red | Green | Blue(UInt8)

    public const func getX(): Int64 {
        return 11
    }
}

enum S9<T, U> where T <: Object {
    | Red | Green | Blue(UInt8)

    public const func getX(): Int64 {
        return 11
    }
}

public class C1 {
    public let v1 = S8<Random, Float64>.Red.getX()

    public const init() {
        let v3 = 0
    }

    public const func f1() {
        S9<Random, Float64>.Green.getX()
    }
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func f() {
    assert(S8<Random, Float64>.Red.getX(), 11)
    assert(S9<Random, Float64>.Red.getX(), 11)
}
