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
    var str1 = "abcaef"
    var str3 = "中国中"
    var res1 = str1.split("a")
    var res3 = str3.split("中")
    for (i in res1) {
        if (i == "bc") {
            return 0
        }
    }
    return 1
}
