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
    var s1: String = "A_b"
    var s2: String = "123"
    var s3: String = "仓颉"
    var s4: String = "\t\b\n"
    var s5: String = "*\t\bA_1"

    var cs1 = s1.split("", 3)
    var cs2 = s2.split("", 2)
    var cs3 = s3.split("", 10)
    var cs4 = s4.split("", 5)
    var cs5 = s5.split("", 3)

    if (cs1[0] != "A" && cs1[1] != "_" && cs1[2] != "b") {
        return 1
    }
    if (cs2[0] != "1" && cs2[1] != "23") {
        return 1
    }
    if (cs3[0] != "仓" && cs3[1] != "颉") {
        return 1
    }
    if (cs4[0] != "\t" && cs4[1] != "\b" && cs4[2] != "\n") {
        return 1
    }
    if (cs5[0] != "*" && cs5[1] != "\t" && cs5[2] != "\bA_1") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
