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
    var s: String = "indexOf"
    var ch1: Byte = UInt8(UInt32(r'i'))
    var i1: Int64 = s.lastIndexOf(ch1, 0) ?? -1
    var ch2: Byte = UInt8(UInt32(r'i'))
    var i2: Int64 = s.lastIndexOf(ch2, 1) ?? -1
    var ch3: Byte = UInt8(UInt32(r'e'))
    var i3: Int64 = s.lastIndexOf(ch3, 1) ?? -1

    print("s2 = " + s + "\n")
    print("lastindexOf(r'i', 0)=" + Int32(i1).toString() + "\n")
    print("lastindexOf(r'i', 1)=" + Int32(i2).toString() + "\n")
    print("lastindexOf(r'e', 1)=" + Int32(i3).toString() + "\n")

    if (i1 == 0 && i2 == -1 && i3 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
