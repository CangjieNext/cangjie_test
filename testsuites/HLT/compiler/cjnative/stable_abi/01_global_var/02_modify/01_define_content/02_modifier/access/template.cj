/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global var: modify access modifier eg: public/protected/internal/private
public var global_var_01: Int64 = 0
protected var global_var_02: Int64 = 0
protected var global_var_03: Int64 = 0
internal var global_var_04: Int64 = 0
internal var global_var_05: Int64 = 0
private var global_var_06: Int64 = 0
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
