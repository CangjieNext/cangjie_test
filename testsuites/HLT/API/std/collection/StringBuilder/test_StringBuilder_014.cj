/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.*
import std.collection.*

main(): Int64 {
    // 与预期的string不匹配
    var strb1 = StringBuilder([r'b', r' ', r'c', r'戸', r'E', r'@', r'。', r'a'])
    if (strb1.toString() != "b c戸E@。a") {
        return 1
    }
    return 0
}
