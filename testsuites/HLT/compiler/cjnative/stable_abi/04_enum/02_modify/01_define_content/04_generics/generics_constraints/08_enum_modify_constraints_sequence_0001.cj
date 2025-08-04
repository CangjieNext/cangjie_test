/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.4.8
  @Scene: modify
  @Visibility: public
  @Object: enum
  @Behavior:  modify generics constraints sequence
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: modify generics
// 修改泛型参数的约束的顺序
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

public enum Pair1<T, U> where U <: Random, T <: ToString {
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
