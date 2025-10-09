/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 8.3
  @Scene: modify
  @Visibility: public
  @Object: import
  @Behavior: modify import module
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// Expect: API Incompatible & ABI Incompatible
// DEPENDENCE: main.cj, template.cj, a, b
// EXEC: %compiler %cmp_opt %compile_lib_opt a/p/p.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt a/q/q.cj -o q.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt b/p/p.cj -o p2.%middle
// EXEC: %compiler %cmp_opt %compile_dylib_opt p1.%middle q.%middle p2.%middle template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt p1.%middle q.%middle p2.%middle %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Added import statement or changed modifier of an existing one.
// ASSERT: scan-1 [API/ABI] Deleted import statement or changed modifier of an existing one.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

package test_stable_abi

// test import: modify public import
import std.math.abs
public import std.math.acos
import a.p.v1
public import b.p.v2

public var v = v1 + v2
