/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify return type
public interface I {}
public interface A <: I { func test() { 0 } }
public class B <: A { const init() {} }
public struct C <: A { const init() {} }
func global_func_01(): A { B() }
func global_func_11(): A { C() }
func global_func_02(): A { B() }
func global_func_12(): A { C() }
const func global_func_03(): A { B() }
const func global_func_13(): A { C() }
public func global_func_04(): A { B() }
public func global_func_14(): A { C() }
public const func global_func_05() { global_func_03() }
public const func global_func_15() { global_func_13() }
@Frozen public func global_func_06() { global_func_02() }
@Frozen public func global_func_16() { global_func_12() }


