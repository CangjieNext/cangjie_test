/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.4.2
  @Scene: delete
  @Visibility: non public
  @Object: struct
  @Behavior: delete generic parameters 
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

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

struct S1<W, T> {
    let s1: Int64 = 0
}
public struct Pair4 {
    let x: S1<Random, Random> = S1<Random, Random>()

}

struct S2<W, T> {
    let s2: Int64 = 0
}

public struct Pair5 {
    let x: S2<Random, Random> = S2<Random, Random>()

     @Frozen
    public func getX(): Int64 {
        return x.s2
    }
}


struct S3<T, U> where T <: Random, U <: Random{
    let x: Int64 = 0
    public const init() {}
}


public struct Pair6 {

    public const init() {}
    public const func getX(): Int64 {

        let x: S3<Random, Random> = S3<Random, Random>()
        return x.x
    }

}

 struct Pair7<T> where T <: Random {
    let x: T
    public init(a: T) {
        x = a
    }
    public func first(): T {
        return x
    }
 
}
