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
    var s1: String = "\0"
    var s2: String = "\0"
    var s3: String = "\t"
    var s4: String = "\t"
    var s5: String = "\n"
    var s6: String = "\n"

    if (s1 == s2 && s3 == s4 && s5 == s6) {
        return 0
    }

    return 1
}
