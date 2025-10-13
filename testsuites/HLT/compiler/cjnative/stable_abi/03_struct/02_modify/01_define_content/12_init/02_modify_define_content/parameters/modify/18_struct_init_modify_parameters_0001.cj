/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.12.2.18
  @Scene: modify
  @Visibility: public
  @Object: struct init
  @Behavior: modify unnamed parameters -> named parameters
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Unnamed parameter cannot be made named parameter.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

package test_stable_abi

public interface I {}

extend UInt64 <: I {}

public struct S {
    public var a: Int64 = 1
    public init(a1: Int64, a2!: UInt64) {
        a = a1
    }
    public init(a1: Int64, a2!: Float32, a3!: Float64) {
        a = a1
    }
    public init(a1: Int64, a2!: Bool = true, a3!: String = "0") {
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
