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
    var str1 = "abcdb"
    var str2 = ""
    var res1 = str1 + 'a'.toString()
    if (res1 != "abcdba") {
        return 1
    }
    var res2 = "中国中" + '中'.toString()
    if (res2 != "中国中中") {
        return 2
    }
    var res3 = str2 + str2
    if (res3 != "") {
        return 3
    }
    return 0
}
