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
    var s1: String = "hello Char lang"
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var s2 = String(chs)
    var s3 = "hello Char lang"
    var s4 = s1[0..5]

    var i1: Int64 = 0
    var i2: Int64 = 2
    var i3: Int64 = 4
    var i4: Int64 = 14

    var res1 = s1[i1]
    var res2 = s2[i4]
    var res3 = s3[i3]
    var res4 = s4[i2]
    var res5 = "123"[i2]

    if (res1 == UInt8(UInt32(r'h')) && res2 == UInt8(UInt32(r'g')) && res3 == UInt8(UInt32(r'o')) && res4 == UInt8(UInt32(r'l')) &&
        res5 == UInt8(UInt32(r'3'))) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
