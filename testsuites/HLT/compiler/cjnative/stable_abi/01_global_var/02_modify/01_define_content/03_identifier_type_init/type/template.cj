/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global var: modify types
public interface I {}
public interface A <: I { func test() { 0 } }
public class B <: A { const init() {} }
public struct C <: A { const init() {} }
var global_var_01: A = B()
var global_var_02: A = B()
const global_var_03: A = B()
var global_var_11: A = C()
var global_var_12: A = C()
const global_var_13: A = C()
public var global_var_04: A = B()
public var global_var_14: A = C()
public const global_var_05 = global_var_03 is A
public const global_var_15 = global_var_13 is A
@Frozen public func global_func_01() { global_var_02 is A }
@Frozen public func global_func_11() { global_var_12 is A }

public func global_func_02() {
    global_var_01 is I
    && global_var_11 is I
}