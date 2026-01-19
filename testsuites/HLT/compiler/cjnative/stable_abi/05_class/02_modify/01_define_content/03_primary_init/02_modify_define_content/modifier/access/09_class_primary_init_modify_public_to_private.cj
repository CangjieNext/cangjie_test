/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.3.2.9
  @Scene: modify
  @Visibility: public
  @Object: class primary_init
  @Behavior: modify public -> private
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0-core
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Class constructor visible outside the module deleted or made private.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public class C1 { private C1(public let v!: Int64 = 0) {} }
public class C2 { protected C2(public let v!: Int64 = 0) {} }
public class C3 { internal C3(public let v!: Int64 = 0) {} }
public class C4 { private C4(public let v!: Int64 = 0) {} }
public class C5 { C5(public let v!: Int64 = 0) {} }
