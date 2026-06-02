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

// 字面量直接调用
main(): Int64 {
    var res1: String = ""
    let iterable = "仓颉".toArray()
    for (i in iterable) {
        res1 = res1 + i.toString()
    }

    if (res1 == "228187147233162137") {
        return 0
    }

    return 1
}
