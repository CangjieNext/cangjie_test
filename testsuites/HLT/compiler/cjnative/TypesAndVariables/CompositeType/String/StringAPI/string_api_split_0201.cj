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
    var r1 = s1.split("")
    if (!compare(r1, "abcaef")) {
        return 1
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
