/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.12.2.22
  @Scene: modify
  @Visibility: public
  @Object: struct init
  @Behavior: modify parameters type
  @Expect: api compatible & abi incompatible
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
// ASSERT: scan-1 [ABI] Changed parameter type of function visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

public interface I {}
extend UInt64 <: I {}
public struct S {
    public var a = 1
    public init(a1: Int64, a2: I) { a = a1 }
    public init(a1: Int64, a2!: Float32, a3!: Float64) { a = a1 }
    public init(a1: Int64, a2!: Bool = true, a3!: String = "0") { a = a1 }
    public const init(a1: Unit, a2!: Int64 = 0) { a = a2 }
    @Frozen public init(a1: Rune, a2!: Int64 = 0) { a = a2 }
}
