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

main(): Int64 {
    var HashMap01: HashMap<Rune, Bool> = HashMap<Rune, Bool>([(r'1', true)])
    var HashMap02: HashMap<Bool, Rune> = HashMap<Bool, Rune>([(false, r'2')])
    var value1 = HashMap01[r'1']
    var value2 = HashMap02[false]
    if (HashMap01.size != 1) {
        return 1
    }
    if (HashMap02.size != 1) {
        return 2
    }
    if (value1 != true) {
        return 3
    }
    if (value2 != r'2') {
        return 4
    }
    return 0
}
