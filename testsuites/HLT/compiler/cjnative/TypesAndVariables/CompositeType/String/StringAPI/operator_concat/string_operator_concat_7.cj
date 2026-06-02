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
    var s1: String = ""
    let s2: String = "\t"
    var s3: String = "\n"
    var s4: String = "\0"
    if ((s1 + s2) != "\t") {
        return 1
    }
    if ((s1 + s3) != "\n") {
        return 1
    }
    if ((s1 + s4) != "\0") {
        return 1
    }
    return 0
}
