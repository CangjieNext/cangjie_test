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

// 索引范围内的操作符
func foo(): String {
    return "cangjie"
}

main(): Int64 {
    var str = "Cangjie"
    var s1 = "仓颉"[..] * 2
    var s2 = str[1..] * 2
    var s3 = foo()[..3]
    var s4 = "仓颉"[0..6 : 1]
    var s4_1 = "仓颉仓颉"[0..9 : 1]
    var s5 = "仓颉仓颉"[0..12 : 1]
    var s6 = "仓颉仓颉"[0..3 : 1]

    if (s1 == "仓颉仓颉" && s2 == "angjieangjie" && s3 == "can" && s4 == "仓颉" && s4_1 == "仓颉仓" && s5 ==
        "仓颉仓颉" && s6 == "仓") {
        return 0
    }
    return 1
}
