/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify non access modifier: unsafe
unsafe func global_func_01() {
    0
}

unsafe func global_func_02() {
    0
}

unsafe const func global_func_03() {
    0
}

public unsafe func global_func_04() {
    0
}

public unsafe const func global_func_05() {
    global_func_03()
}

@Frozen
public unsafe func global_func_06() {
    global_func_02()
}
