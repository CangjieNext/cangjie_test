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

main(): Int64 {
    var r1 = "ab cb".runes()
    var r2 = "".runes()
    var r3 = "中国中".runes()
    var r4 = String().runes()
    var res = "|"
    for (i in r1) {
        res = res + "${i}"
    }
    res = res + "|"
    for (i in r2) {
        res = res + "${i}"
    }
    res = res + "|"
    for (i in r3) {
        res = res + "${i}"
    }
    res = res + "|"
    for (i in r4) {
        res = res + "${i}"
    }
    res = res + "|"
    if (res != "|ab cb||中国中||") {
        return 1
    }
    return 0
}
