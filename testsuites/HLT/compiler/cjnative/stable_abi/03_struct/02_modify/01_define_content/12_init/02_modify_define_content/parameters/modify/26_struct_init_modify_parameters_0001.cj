/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.12.2.26
  @Scene: modify
  @Visibility: public
  @Object: struct init
  @Behavior: modify non const func or non @Frozen func default value for named parameters
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

package test_stable_abi

public interface I {}

extend UInt64 <: I {}

public struct S {
    public var a: Int64 = 1
    public init(a1: Int64, a2: UInt64) {
        a = a1
    }
    public init(a1: Int64, a2!: Float32, a3!: Float64) {
        a = a1
    }
    public init(a1: Int64, a2!: Bool = false, a3!: String = "1") {
        a = a1
    }
    public const init(a1: Unit, a2!: Int64 = 0) {
        a = a2
    }
    @Frozen
    public init(a1: Rune, a2!: Int64 = 0) {
        a = a2
    }
}
