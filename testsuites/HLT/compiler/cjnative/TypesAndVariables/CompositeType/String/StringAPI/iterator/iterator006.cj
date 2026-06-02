/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// for循环自动调用对象的iterator()方法
func getLongString(): String {
    var str: String = "仓颉"
    var count = 1
    while (count < 1000) {
        if (count % 2 == 0) {
            str = str + "仓颉"
        } else {
            str = str + "Cangjie"
        }
        count = count + 1
    }
    str = str + "end"
    str
}

main(): Int64 {
    var c1: Rune = r'仓'
    var c2: Rune = r'C'
    var c3: Rune = r'a'
    for (i in "仓颉".runes()) {
        c1 = i
    }
    for (i in "Cangjie") {
        c2 = Rune(UInt32(i))
    }
    for (i in getLongString()) {
        c3 = Rune(UInt32(i))
    }

    if (c1 == r'颉' && c2 == r'e' && c3 == r'd') {
        return 0
    }
    return 1
}
