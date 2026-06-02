/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.4.8
  @Scene: modify
  @Visibility: public
  @Object: struct
  @Behavior: modify generic constraints order
  @Expect: api compatible & abi compatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: modify generics
// 修改泛型参数的约束的顺序

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

public struct Pair1<T, U> where U <: Random , T <: ToString{
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

 struct Pair2<T, U> where T <: Random, U <: Random {
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

struct S2<T, U> where T <: Random, U <: ToString {
    let s1: Int64 = 0
}

public struct Pair15 {
    let x: S2<Random, ToString> = S2<Random, ToString>()
}

struct S3<T, U> where T <: Random, U <: ToString{
    let x: Int64 = 0
    public const init() {}
}


public struct Pair3 {

    public const init() {}
    public const func getX(): Int64 {

        let x: S3<Random, ToString> = S3<Random, ToString>()
        return x.x
    }

}

struct S12<T, U> where T <: Random, U <: ToString {
    let s1: Int64 = 0
}

public struct Pair18 {
    let x: S12<Random, ToString > = S12<Random, ToString>()

    @Frozen
    public func getX(): Int64 {
        return x.s1
    }
}

