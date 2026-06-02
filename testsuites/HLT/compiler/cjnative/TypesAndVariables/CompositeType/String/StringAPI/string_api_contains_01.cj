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
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res1 = str1.contains("")
    var res2 = str2.contains("")
    var res3 = str3.contains("中")
    var res4 = str1.contains("中")
    if (!res1) {
        return 1
    }
    if (!res2) {
        return 2
    }
    if (!res3) {
        return 3
    }
    if (res4) {
        return 4
    }
    return 0
}
