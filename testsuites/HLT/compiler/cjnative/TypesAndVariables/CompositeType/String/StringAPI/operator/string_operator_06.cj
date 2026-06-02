/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s1: String = "hello Char lang"
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var s2 = String(chs)
    var s3 = "hello Char lang"
    var s4 = s1[0..5]

    var i1: Int64 = -1
    var i2: Int64 = -2
    var i3: Int64 = -4
    var i4: Int64 = -9223372036854775808

    var res1 = s1[i1]
    var res2 = s2[i2]
    var res3 = s3[i3]
    var res4 = s4[i3]
    var res5 = "123"[i4]

    return 0
}

main(): Int64 {
    return run()
}
