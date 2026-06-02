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

// 英文字符串
main(): Int64 {
    var str1 = "仓颉"
    var str2 = "CangJie"
    var res1: String = ""
    let iterable = str2.toArray()
    for (i in iterable) {
        res1 = res1 + i.toString() + " "
    }
    if (res1 == "67 97 110 103 74 105 101 ") {
        return 0
    }

    return 1
}
