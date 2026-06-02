/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


package test

import std.ast.*

// not supported yet.

@OverflowSaturating
public macro M(m:Tokens){
    var a : Int8 = 127
    var b = a+a
    print("b is ${b}\n")
    return m
}
// ASSERT: scan parse_unexpected_anno_on
