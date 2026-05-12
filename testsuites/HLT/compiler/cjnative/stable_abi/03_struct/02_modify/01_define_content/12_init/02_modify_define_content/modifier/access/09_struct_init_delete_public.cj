/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.12.2.9
  @Scene: modify
  @Visibility: public
  @Object: struct init
  @Behavior: modifier: public -> non public
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed init function's modifier of struct visible outside the module. public/const/static deleted or unsafe/mut/static added.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public struct S {
    public var a = 1
    init(a1: UInt8) { a = Int64(a1) }
    protected init(a1: Int16) {}
    protected init(a1: UInt16) {}
    internal init(a1: Int32) {}
    internal init(a1: UInt32) {}
    private init(a1: Int64) {}
    private init(a1: UInt64) {}
    init(a1: Int8) {}
    init(a1: Float32) {}
    init(a1: Float64) {}
}
