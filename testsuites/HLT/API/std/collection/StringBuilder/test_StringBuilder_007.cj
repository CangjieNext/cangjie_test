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
    var strb4 = StringBuilder("")
    if (strb4.size != 0) {
        return 4
    }

    var strb5 = StringBuilder("123")
    if (strb5.size != 3) {
        return 5
    }

    var strb6 = StringBuilder(Array<Rune>())
    if (strb6.size != 0) {
        return 6
    }

    var arr7: Array<Rune> = Array<Rune>(1024, repeat: r'A')
    var strb7 = StringBuilder(arr7)
    if (strb7.size != 1024) {
        return 7
    }

    return 0
}
