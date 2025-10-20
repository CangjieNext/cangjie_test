/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global var: modify non access modifier eg: let/var/const
let global_var_01: Int64 = 0
let global_var_02: Int64 = 0
public let global_var_03: Int64 = 0
@Frozen public func global_func_01() { global_var_02 }


