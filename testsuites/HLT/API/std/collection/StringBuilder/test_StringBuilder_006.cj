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

main(): Int32 {
    var count = 0

    var arr1: Array<Rune> = Array<Rune>(1024, repeat: r'A')
    var strb1 = StringBuilder(arr1)
    if (strb1.size == 1024) {
        return 0
    }
    return 1
}
