/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.12.2.2
  @Scene: modify
  @Visibility: public
  @Object: struct init
  @Behavior: add @Deprecated, strict: true
  @Expect: api incompatible & abi incompatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed init function's annotation of struct visible outside the module. Deprecated strict added.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public struct S {
    public var a = 1
    @Deprecated["this init is deprecated", strict: true] public init() { a = 0 }
    @Deprecated["this init is deprecated", strict: false] public init(a1: Int64) { a = a1 }
    @Deprecated["this init is deprecated", strict: true] public init(a1: Int64, a2: Int64) { a = a1 + a2 }
}

public func f(){
    return 0
}
