/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 8.2
  @Scene: delete
  @Visibility: public
  @Object: import
  @Behavior: delete import
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// Expect: API Incompatible & ABI Incompatible
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Deleted import statement or changed modifier of an existing one.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test import: delete public import
import std.ast.*
import std.collection.*
public import std.math.*

let list = ArrayList<Int64>([-2,-1,0,1,2])
public var a : Int64 = abs(list[0] + list[1] +list[2] + list[3] + list[4])
