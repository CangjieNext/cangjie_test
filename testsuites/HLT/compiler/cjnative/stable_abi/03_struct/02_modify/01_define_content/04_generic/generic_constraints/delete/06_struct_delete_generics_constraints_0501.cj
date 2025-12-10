/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.4.6
  @Scene: delete
  @Visibility: used in public @Frozen declare
  @Object: struct
  @Behavior: delete generics constraint
  @Expect: api compatible & abi Incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Deleted generic constraint of struct visible outside the module.
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
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


struct S1<T, U> where T <: Random{
    let s1: Int64 = 0
}

public struct Pair2 {
    let x: S1<Random, Random> = S1<Random, Random>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
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

struct S9<T, U> where T <: Random, U <: Random {
    let s1: Int64 = 0
}

public struct Pair15 {
    let x: S9<Random, Random> = S9<Random, Random>()
}

struct S4<T, U>  where T <: Random, U <: Random{
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
