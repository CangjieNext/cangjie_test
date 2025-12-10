/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 1.2.1.2.2
  @Scene: modify
  @Visibility: non public
  @Object: global var
  @Behavior: modifier: non public -> public
  @Expect: api compatible & abi compatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global var: modify access modifier eg: public/protected/internal/private
// global var: non public global var
// modify operation: modify non public modifier -> public modifier
public var global_var_01: Int64 = 0
public var global_var_02: Int64 = 0
protected var global_var_03: Int64 = 0
public var global_var_04: Int64 = 0
internal var global_var_05: Int64 = 0
public var global_var_06: Int64 = 0
private var global_var_07: Int64 = 0
var global_var_08: Int64 = 0
var global_var_09: Int64 = 0
var global_var_10: Int64 = 0

public func global_func_01() {
    global_var_08 == 0
    && global_var_10 == 0
    && global_var_02 == 0
    && global_var_04 == 0
    && global_var_06 == 0
    && global_var_09 == 0
    && global_var_03 == 0
    && global_var_05 == 0
    && global_var_07 == 0
}
