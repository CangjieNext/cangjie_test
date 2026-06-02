/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s1: String = "hello Char lang "
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var s2 = String(chs)
    var s3 = "hello Char lang"
    var s4 = s1[0..5]
    var s5 = ""

    var i0: Int64 = 1
    var i1: Int64 = 20
    var i2: Int64 = 9223372036854775807
    var res1 = s1[i1]
    var res2 = s2[i1]
    var res3 = s3[i1]
    var res4 = s4[i1]
    var res5 = s5[i0]
    var res6 = "123"[i2]
    print("s1 = " + s1 + "\n")
    print("s1[20] = [" + res1.toString() + "]" + "\n")
    print("s2 = " + s2 + "\n")
    print("s2[20] = [" + res2.toString() + "]" + "\n")
    print("s3 = " + s3 + "\n")
    print("s3[20] = [" + res3.toString() + "]" + "\n")
    print("s4 = " + s4 + "\n")
    print("s4[20] = [" + res4.toString() + "]" + "\n")
    print("s5 = " + s5 + "\n")
    print("s5[1] = [" + res5.toString() + "]" + "\n")
    print("s6 = " + "123" + "\n")
    print("s6[223372036854775807] = [" + res6.toString() + "]" + "\n")

    if (res1 == UInt8(UInt32(r' ')) && res2 == UInt8(UInt32(r' ')) && res3 == UInt8(UInt32(r' ')) && res4 == UInt8(UInt32(r' ')) &&
        res5 == UInt8(UInt32(r' ')) && res6 == UInt8(UInt32(r' '))) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
