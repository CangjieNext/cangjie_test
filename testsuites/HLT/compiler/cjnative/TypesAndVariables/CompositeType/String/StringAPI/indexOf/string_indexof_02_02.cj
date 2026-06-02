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
    var chs = [r'i', r'n', r'n', r'n', r'd', r'e', r'x', r'O', r'f', r' ', r'\u{5234}', r' ', r'T', r'e', r's', r't']
    var s1: String = String(chs)

    var i1: Int64 = s1.indexOf("\u{5234}") ?? -1
    var ch2: Byte = UInt8(UInt32(r'n'))
    var i2: Int64 = s1.indexOf(ch2) ?? -1
    var ch3: Byte = UInt8(UInt32(r' '))
    var i3: Int64 = s1.indexOf(ch3) ?? -1

    print("s = " + s1 + "\n")
    print("indexOf(r'\u{5234}')=" + Int32(i1).toString() + "\n")
    print("indexOf(r'n')=" + Int32(i2).toString() + "\n")
    print("indexOf(r' ')=" + Int32(i3).toString() + "\n")

    if (i1 == 10 && i2 == 1 && i3 == 9) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
