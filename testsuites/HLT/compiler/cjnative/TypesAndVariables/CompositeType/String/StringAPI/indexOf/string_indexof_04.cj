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

    var i1: Int64 = s.indexOf("\u{5234}", 3) ?? -1
    var ch2: Byte = UInt8(UInt32(r'T'))
    var i2: Int64 = s.indexOf(ch2, 3) ?? -1
    var ch3: Byte = UInt8(UInt32(r' '))
    var i3: Int64 = s.indexOf(ch3, 3) ?? -1

    print("s = " + s + "\n")
    print("indexOf('\u{5234}', 3)=" + Int32(i1).toString() + "\n")
    print("indexOf(r'T', 3)=" + Int32(i2).toString() + "\n")
    print("indexOf(r' ', 3)=" + Int32(i3).toString() + "\n")

    if (i1 == 8 && i2 == 12 && i3 == 7) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
