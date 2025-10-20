/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 1.2.1.1.1
  @Scene: modify
  @Visibility: used in public const declare
  @Object: global var
  @Behavior: add @Deprecated, strict: false
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

// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global var: modify compiler directive
// global var: global var is used in const global var/func
// modify operation: add @Deprecated, strict: false
var global_var_01: Int64 = 0
var global_var_02: Int64 = 0
@Deprecated["this var is deprecated", strict: false] const global_var_03: Int64 = 0
@Deprecated["this var is deprecated", strict: true] var global_var_04: Int64 = 0
@Deprecated["this var is deprecated", strict: true] var global_var_05: Int64 = 0
@Deprecated["this var is deprecated", strict: true] const global_var_06: Int64 = 0
@Deprecated["this var is deprecated", strict: false] var global_var_07: Int64 = 0
@Deprecated["this var is deprecated", strict: false] var global_var_08: Int64 = 0
@Deprecated["this var is deprecated", strict: false] const global_var_09: Int64 = 0

public var global_var_10: Int64 = 0
@Deprecated["this var is deprecated", strict: true] public var global_var_11: Int64 = 0
@Deprecated["this var is deprecated", strict: false] public var global_var_12: Int64 = 0

public const global_var_13: Int64 = global_var_03
@Deprecated["this var is deprecated", strict: true] public const global_var_14: Int64 = global_var_06
@Deprecated["this var is deprecated", strict: false] public const global_var_15: Int64 = global_var_09

@Frozen
public func global_func_01() {
    global_var_02
}

@Frozen
@Deprecated["this func is deprecated", strict: true]
public func global_func_02() {
    global_var_05
}

@Frozen
@Deprecated["this func is deprecated", strict: false]
public func global_func_03() {
    global_var_08
}
