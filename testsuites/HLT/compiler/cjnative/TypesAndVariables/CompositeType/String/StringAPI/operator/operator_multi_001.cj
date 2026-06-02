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

// 中英文字符
main(): Int64 {
    var s1 = "仓颉" * 2
    var s2 = "cangjie" * 2
    var s3 = "\u{255}" * 2
    let s4 = "仓颉" * 0
    let s5 = "仓颉" * 1

    if (s1 == "仓颉仓颉" && s2 == "cangjiecangjie" && s3 == "\u{255}\u{255}" && s4 == "" && s5 == "仓颉") {
        return 0
    }
    return 1
}
