/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 9.2
  @Scene: delete
  @Visibility: public
  @Object: typealias
  @Behavior: delete public typealias
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
// ASSERT: scan-1 [API/ABI] Public type alias deleted.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test typeAlias: delete public typeAlias
type Mytype1 = Int64
type Mytype2 = Int32
public type Mytype3 = Float64
public var a: Mytype1 = 1
var b: Mytype2 = 2
public var c: Mytype3 = 1.1
