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
    var t1 = !10 // The result is -11
    var t2 = !20 // The result is -21
    var t3 = 10 << 1 // The result is 20
    var t4 = 10 << 1 << 1 // The result is 40
    var t5 = 10 >> 1 // The result is 5
    var t6 = 10 & 15 // The result is 10
    var t7 = 10 ^ 15 // The result is 5
    var t8 = 10 | 15 // The result is 15
    var t9 = 1 ^ 8 & 15 | 24 // The result is 25

    print("${t1}\n${t2}\n${t3}\n${t4}\n${t5}\n${t6}\n${t7}\n${t8}\n${t9}\n")
    return 0
}
