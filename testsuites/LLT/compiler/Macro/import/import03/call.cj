// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mod1 mod2
// EXEC: %compiler %cmp_opt %cmp_macro mod1/define1.cj
// EXEC: %compiler %cmp_opt %cmp_macro mod2/define2.cj
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan package name 'define' is conflicted with other imported package name, please use 'as' to eliminate conflict.
import mod1.define
import mod2.define

@define.M
func test() {
    println("test")
}
