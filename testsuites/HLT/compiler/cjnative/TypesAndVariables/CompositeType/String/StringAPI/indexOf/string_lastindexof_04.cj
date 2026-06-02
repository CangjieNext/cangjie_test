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
    var s: String = "indexOf \u{5234} Test indexOf \u{5234} Test"

    var i1: Int64 = s.lastIndexOf("\u{5234}", 13) ?? -1 // t is index 13
    var ch2: Byte = UInt8(UInt32(r'T'))
    var i2: Int64 = s.lastIndexOf(ch2, 13) ?? -1
    var ch3: Byte = UInt8(UInt32(r' '))
    var i3: Int64 = s.lastIndexOf(ch3, 13) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf('\u{5234}', 13)=" + Int32(i1).toString() + "\n")
    print("lastIndexOf(r'T', 13)=" + Int32(i2).toString() + "\n")
    print("lastIndexOf(r' ', 13)=" + Int32(i3).toString() + "\n")

    if (i1 == 25 && i2 == 29 && i3 == 28) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
