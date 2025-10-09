/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.8.2.18
  @Scene: add
  @Visibility: used in public @Frozen declare
  @Object: struct static func
  @Behavior: add public function generics parameter
  @Expect: api incompatible & abi incompatible
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
// ASSERT: scan-1 [API/ABI] Added generic param of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: add function generics parameter
package test_stable_abi

import std.random.*

open public class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public struct Rectangle {
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    static func geta<T, U>(): Int64 {
        return 0
    }

    public static func getb<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public static func getc<T, U>(): Int64 where T <: Random {
        return 0
    }

    static func getd<T, U>(): Int64 where T <: ToString {
        return 0
    }

    @Frozen
    public static func gete() {
        let x = getd<ToString, Random>()
        return x
    }

    public static func getf<T, U>(): Int64 {
        return 0
    }

    static func getg<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    @Frozen
    public static func geth() {
        let x = getg()
        return x
    }

    public static func geti<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public static func getj<T, U>(): Int64 where T <: B, U <: Random {
        return 0
    }

    static func getk<T, U>(): Int64 where T <: B, U <: Random {
        return 0
    }

    @Frozen
    public static func getl() {
        let x = getk()
        return x
    }

    static func getm<T, U>(): Int64 where T <: B, U <: Random {
        return 0
    }

    static func getn<T, U>(a: T, b: U): Int64 {
        let A = a
        let B = b
        return 10 
    }

    @Frozen
    public static func geto() {

        let x = getn(10, 20)
        return x
    }
}