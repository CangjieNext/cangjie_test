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
    var r1 = " ab cb ".trimAscii()
    var r2 = "".trimAscii()
    var r3 = "中国中".trimAscii()
    var r4 = String().trimAscii()
    if (r1 != "ab cb") {
        return 1
    }
    if (r2 != "") {
        return 2
    }
    if (r3 != "中国中") {
        return 3
    }
    if (r4 != "") {
        return 4
    }
    return 0
}
