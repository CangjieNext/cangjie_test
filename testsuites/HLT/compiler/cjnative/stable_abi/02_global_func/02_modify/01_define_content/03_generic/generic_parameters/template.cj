/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify generic parameters
public class A {}
func global_func_01<T1, T2>() where T1 <: A, T2 <: A { 0 }
func global_func_02<T1, T2>() { 0 }
func global_func_03<T1, T2>() { 0 }
const func global_func_04<T1, T2>() { 0 }
public func global_func_05<T1, T2>() { 0 }
public const func global_func_06<T1, T2, T3>() { global_func_04<T1, T2>() }
@Frozen public func global_func_07() { global_func_03<A, A>() }


