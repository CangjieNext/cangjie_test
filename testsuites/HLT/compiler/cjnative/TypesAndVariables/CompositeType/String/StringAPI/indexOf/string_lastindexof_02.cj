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
    var s: String = "Last InnndexOf \u{5234}\u{5234} Test"
    var chs = [r'L', r'a', r's', r't', r' ', r'I', r'n', r'n', r'n', r'd', r'e', r'x', r'O', r'f', r' ', r'\u{5234}',
        r'\u{5234}', r' ', r'T', r'e', r's', r't']
    var s1: String = String(chs)
    var s2: String = "Last InnndexOf \u{5234}\u{5234} Test"

    var i1: Int64 = s.lastIndexOf("\u{5234}") ?? -1
    var ch2: Byte = UInt8(UInt32(r'n'))
    var i2: Int64 = s1.lastIndexOf(ch2) ?? -1
    var ch3: Byte = UInt8(UInt32(r' '))
    var i3: Int64 = s2.lastIndexOf(ch3) ?? -1

    print("s = " + s + "\n")
    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("lastIndexOf(r'\u{5234}')=" + Int32(i1).toString() + "\n")
    print("lastIndexOf(r'n')=" + Int32(i2).toString() + "\n")
    print("lastIndexOf(r' ')=" + Int32(i3).toString() + "\n")

    if (i1 == 18 && i2 == 8 && i3 == 21) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
