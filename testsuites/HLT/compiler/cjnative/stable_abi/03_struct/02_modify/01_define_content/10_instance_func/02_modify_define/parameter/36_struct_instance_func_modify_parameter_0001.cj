/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.10.2.36
  @Scene: modify
  @Visibility:public
  @Object: struct instance func
  @Behavior: modify public function parameter type: sub -> parent
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed parameter type of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-not [API/ABI]

// test struct: modify public function parameter type: sub -> parent
package test_stable_abi

import std.random.*

public open class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public struct Rectangle {
    let width = 10
    let a1 = 20

    public func getWidth(): Int64 {
        return width
    }

    public func geta(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    func geta1(a: Int64, b!: Int64) {
        return 1
    }

    @Frozen
    public func geta2() {
        let x = geta1(1, b: 1)
        return x
    }

    public func geta3(a: Int64, b!: Int64) {
        return 1
    }

    func geta4(a: Int64, b: Float64, c!: Int64 = 1, d!: Float64 = 2.2) {
        return 1
    }

    @Frozen
    public func geta5() {
        let x = geta4(1, 2.1, c: 1, d: 2.2)
        return x
    }

    public func geta6(a: Int64, b: Float64, c!: Int64 = 1, d!: Float64 = 2.2) {
        return 1
    }

    func geta7(a: A, b: B) {
        return 1
    }

    @Frozen
    public func geta8() {
        let x = geta7(A(), B())
        return x
    }

    public func geta9(a: A, b: A) {
        return 1
    }
}
