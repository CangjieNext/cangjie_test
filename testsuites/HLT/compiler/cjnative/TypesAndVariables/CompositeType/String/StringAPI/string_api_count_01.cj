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
    var str1 = "abcac"
    var str3 = "中国中国会"
    var res1 = str1.count("a")
    var res2 = str1.count("a*")
    var res3 = str3.count("中")
    var res4 = str3.count("国中")
    if (res1 != 2) {
        return 1
    }
    if (res2 != 0) {
        return 1
    }
    if (res3 != 2) {
        return 3
    }
    if (res4 != 1) {
        return 1
    }
    return 0
}
