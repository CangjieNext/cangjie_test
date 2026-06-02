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
    var s1 = "abcaef"
    var s2 = ""
    var s3 = "中国中心"
    var r1 = s1.split("a")
    var r3 = s3.split("中")
    var r4 = s3.split("国中")
    var r5 = s1.split("bae")
    if (!compare(r1, "bcef")) {
        return 1
    }
    if (!compare(r3, "国心")) {
        return 3
    }
    if (!compare(r4, "中心")) {
        return 4
    }
    if (!compare(r5, "abcaef")) {
        return 5
    }
    return 0
}

func compare(inpurt: Array<String>, res: String) {
    var exp = ""
    for (i in inpurt) {
        exp = exp + "${i}"
    }
    if (exp != res) {
        return false
    }
    return true
}
