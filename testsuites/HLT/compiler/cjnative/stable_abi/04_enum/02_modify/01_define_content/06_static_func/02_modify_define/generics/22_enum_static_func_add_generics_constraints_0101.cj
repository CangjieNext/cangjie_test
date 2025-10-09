/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.22
  @Scene: add
  @Visibility: used in public @Frozen declare
  @Object: enum static func
  @Behavior: add generics constraints
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Added generic constraint of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: add function generics contraint
package test_stable_abi

import std.random.*

open public class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
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

    static func getd<T>(): Int64 where T <: ToString {
        return 0
    }

    @Frozen
    public static func gete() {
        let x = getd()
        return x
    }

    public static func getf<T, U>(): Int64 {
        return 0
    }

    static func getg<T, U>(): Int64 where T <: ToString & Any, U <: Random {
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
}