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
    var s: String = "indexOf Test"
    var s2: String = s[0..7]
    var ch1: Byte = UInt8(UInt32(r'e'))
    var i1: Int64 = s2.indexOf(ch1, 8) ?? -1
    var ch2: Byte = UInt8(UInt32(r'e'))
    var i2: Int64 = s2.indexOf(ch2, 2) ?? -1

    print("s2 = " + s2 + "\n")
    print("indexOf(r'e', 8)=" + Int32(i1).toString() + "\n")
    print("indexOf(r'e', 2)=" + Int32(i2).toString() + "\n")

    if (i1 == -1 && i2 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
