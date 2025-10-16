/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.1.4
  @Scene: modify
  @Visibility: non public
  @Object: global func
  @Behavior: modify @Deprecated: error -> warning
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

// test global func: modify compiler directive
// global func: non public global func
// modify operation: modify @Deprecated: error -> warning
func global_func_01() { 0 }
func global_func_02() { 0 }
const func global_func_03() { 0 }
@Deprecated["this var is deprecated", strict: false] func global_func_04() { 0 }
@Deprecated["this var is deprecated", strict: true] func global_func_05() { 0 }
@Deprecated["this var is deprecated", strict: true] const func global_func_06() { 0 }
@Deprecated["this var is deprecated", strict: false] func global_func_07() { 0 }
@Deprecated["this var is deprecated", strict: false] func global_func_08() { 0 }
@Deprecated["this var is deprecated", strict: false] const func global_func_09() { 0 }

public func global_func_10() { 0 }
@Deprecated["this var is deprecated", strict: true] public func global_func_11() { 0 }
@Deprecated["this var is deprecated", strict: false] public func global_func_12() { 0 }

public const func global_func_13() { global_func_03() }
@Deprecated["this var is deprecated", strict: true] public const func global_func_14() { global_func_06() }
@Deprecated["this var is deprecated", strict: false] public const func global_func_15() { global_func_09() }

@Frozen
public func global_func_16() {
    global_func_02()
}

@Frozen
@Deprecated["this func is deprecated", strict: true]
public func global_func_17() {
    global_func_05()
}

@Frozen
@Deprecated["this func is deprecated", strict: false]
public func global_func_18() {
    global_func_08()
}
