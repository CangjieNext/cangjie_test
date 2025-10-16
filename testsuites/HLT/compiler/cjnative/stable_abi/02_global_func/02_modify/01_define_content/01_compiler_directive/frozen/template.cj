/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify compiler directive
func global_func_01() { 0 }
func global_func_02() { 0 }
const func global_func_03() { 0 }
@Frozen func global_func_04() { 0 }
@Frozen func global_func_05() { 0 }
@Frozen const func global_func_06() { 0 }

public func global_func_07() { 0 }
@Frozen public func global_func_08() { 0 }

public const func global_func_09() { global_func_03() }
public const func global_func_10() { global_func_06() }

@Frozen
public func global_func_11() {
    global_func_02()
}

@Frozen
public func global_func_12() {
    global_func_05()
}


