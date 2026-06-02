/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

let op = Option<Rune>.Some(r'm')
var r1 = ArrayList<Option<Rune>>([op])
var r2 = ArrayList<Option<Rune>>([Option<Rune>.Some(r'm')])

func case01(x: Option<Rune>) {
    return match (x) {
        case Some(z) => z
        case None => r'c'
    }
}

main(): Int64 {
    if (r1.size != 1) {
        return 1
    }
    if (r2.size != 1) {
        return 2
    }
    if (case01(r1[0]) != r'm') {
        return 3
    }
    if (case01(r2[0]) != r'm') {
        return 4
    }
    return 0
}
