/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 1.2.1.3.4
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: global var
  @Behavior: modify const init
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Modified global variable const initial value.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global var: modify init
// global var: global var is used in @Frozen global func
// modify operation: modify const init
var global_var_01: Int64 = 0
var global_var_02: Int64 = 0
const global_var_03: Int64 = 0
const global_var_04: Int64 = 22222
const global_var_05: Int64 = 0

public var global_var_06: Int64 = 0
public const global_var_07: Int64 = 0

public const global_var_08: Int64 = global_var_05

@Frozen
public func global_func_01() {
    global_var_02
}

@Frozen
public func global_func_02() {
    global_var_04
}

public func global_func_03() {
    global_var_01
}

public func f(){
    return 0
}