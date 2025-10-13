/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 1.2.1.3.2
  @Scene: modify
  @Visibility: used in public const declare
  @Object: global var
  @Behavior: modify type
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Modified global variable const initial value.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global var: modify return type
// global var: global var is used in const global var/func
// modify operation: class type B <: A, modify type A -> B
public interface I {}

public interface A <: I {
    func test() {
        0
    }
}

public class B <: A {
    const init() {}
}

public struct C <: A {
    const init() {}
}

var global_var_01: A = B()
var global_var_02: A = B()
const global_var_03: B = B()
var global_var_11: A = C()
var global_var_12: A = C()
const global_var_13: A = C()
public var global_var_04: A = B()
public var global_var_14: A = C()
public const global_var_05 = global_var_03 is A
public const global_var_15 = global_var_13 is A

@Frozen
public func global_func_01() {
    global_var_02 is A
}

@Frozen
public func global_func_11() {
    global_var_12 is A
}
