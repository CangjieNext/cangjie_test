/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.4.4
  @Scene: modify
  @Visibility: public | used in public const declare | used in public struct/class instance var
  @Object: enum
  @Behavior: modify generics parameters sequence
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [API/ABI] Changed generic param of enum visible outside the module.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-1 [API/ABI] Modified member variables' type for class visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-4 [API/ABI]

// test enum: modify generics
// 修改泛型参数的顺序
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

public enum S7<U, T> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8<U, T> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9<U, T> where T <: Random {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public class C1 {
    let v1 = S8<Float64, Random>.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9<Float64, Random>.Green
    }
}
