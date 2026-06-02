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
    var s: String = "abcdefg"
    var ch2: Byte = UInt8(UInt32(r'a'))
    var i2: Int64 = s.indexOf(ch2, 0) ?? -1
    var ch3: Byte = UInt8(UInt32(r'c'))
    var i3: Int64 = s.indexOf(ch3, 1) ?? -1
    var ch4: Byte = UInt8(UInt32(r'd'))
    var i4: Int64 = s.indexOf(ch4, 2) ?? -1
    var ch5: Byte = UInt8(UInt32(r'g'))
    var i5: Int64 = s.indexOf(ch5, 5) ?? -1

    print("s = " + s + "\n")
    print("indexOf(r'a', 0)=" + Int32(i2).toString() + "\n")
    print("indexOf(r'c', 1)=" + Int32(i3).toString() + "\n")
    print("indexOf(r'd', 2)=" + Int32(i4).toString() + "\n")
    print("indexOf(r'g', 5)=" + Int32(i5).toString() + "\n")

    if (i2 == 0 && i3 == 2 && i4 == 3 && i5 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
