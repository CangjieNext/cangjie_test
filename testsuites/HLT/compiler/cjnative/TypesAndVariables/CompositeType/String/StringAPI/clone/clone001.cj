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
    var s1 = "".clone()
    var s2 = " ".clone()
    var s3 = "Cangjie".clone()
    var s4 = "${s3}!".clone()
    var a = "仓颉！\u{255}"
    var s5 = a.clone()
    var s6 = String([r'1', r'2', r'3']).clone()
    if (s1 == "" && s2 == " " && s3 == "Cangjie" && s4 == "Cangjie!" && s5 == "仓颉！\u{255}" && s6 == "123") {
        return 0
    }
    return 1
}
