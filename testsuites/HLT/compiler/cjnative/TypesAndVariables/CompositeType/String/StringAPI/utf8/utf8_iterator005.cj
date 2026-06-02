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

// 字符串中含转义字符
main(): Int64 {
    var str = "\u{516}\u{1000}"
    var res = ""
    let iterable1 = str.toArray()
    for (i in iterable1) {
        res = res + i.toString() + " "
    }

    if (res == "212 150 225 128 128 ") {
        return 0
    }

    return 1
}
