/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex \"Cangjie1仓颉！ɕ123

main(): Int64 {
    var iter1 = "".runes()
    var iter3 = "\"".runes()
    var iter4 = "Cangjie".runes()
    var iter5 = "1".runes()
    var a = "仓颉！\u{255}"
    var iter6 = a.runes()
    var iter7 = String([r'1', r'2', r'3']).runes()

    for (i in iter1) {
        print("${i}")
    }
    for (i in iter3) {
        print("${i}")
    }
    for (i in iter4) {
        print("${i}")
    }
    for (i in iter5) {
        print("${i}")
    }
    for (i in iter6) {
        print("${i}")
    }
    for (i in iter7) {
        print("${i}")
    }

    return 0
}
