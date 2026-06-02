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
    var r1 = " ab cb ".trimAsciiStart()
    var r2 = "".trimAsciiStart()
    var r3 = "中国中".trimAsciiStart()
    var r4 = String().trimAsciiStart()
    var r7 = " ".trimAsciiStart()

    if (r1 != "ab cb ") {
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
    if (r7 != "") {
        return 7
    }

    return 0
}
