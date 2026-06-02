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

func run(): Int64 {
    var s1: String = "Ab_bc"
    var s2: String = "1678_23"
    var s3: String = "仓_颉"
    var s4: String = "\tbng_\n\b"
    var s5: String = "A_bc1_23仓_颉\t_\n\b"

    if (!s1.startsWith("Ab") || !s2.startsWith("1678_") || !s3.startsWith("仓")
        || !s4.startsWith("\tbng") || !s5.startsWith("A_")) {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
