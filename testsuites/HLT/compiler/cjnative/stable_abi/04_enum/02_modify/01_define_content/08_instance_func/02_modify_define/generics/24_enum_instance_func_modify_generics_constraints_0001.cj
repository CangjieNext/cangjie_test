/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.8.2.24
  @Scene: modify
  @Visibility: public
  @Object: enum instance func
  @Behavior: modify generics constraints, sub type -> parent type
  @Expect: api compatible & abi incompatible
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
// ASSERT: scan-1 [ABI] Changed generic constraint of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API/ABI]

// test enum: modify generics constraint with public: sub type -> parent type
package test_stable_abi

import std.random.*

public open class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    func geta<T, U>(): Int64 {
        return 0
    }

    public func getb<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public func getc<T, U>(): Int64 where T <: Random {
        return 0
    }

    func geta1<T, U>(): Int64 where T <: B {
        return 0
    }

    @Frozen
    public func geta2() {
        let x = geta1<B, Random>()
        return 1
    }

    public func geta3<T, U>(): Int64 where T <: A {
        return 1
    }
}
