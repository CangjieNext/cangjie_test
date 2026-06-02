/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output  %run_args 2>&1 | compare %f
// ASSERT: scan s = indexOf indexOf
// ASSERT: scan lastIndexOf(r'n', -7)=9
// ASSERT: scan lastIndexOf(r' ', -2)=15

func run(): Int64 {
    var s: String = "indexOf indexOf "
    var ch1: Byte = UInt8(UInt32(r'n'))
    var i1: Int64 = s.lastIndexOf(ch1, -7) ?? -1
    var ch2: Byte = UInt8(UInt32(r' '))
    var i2: Int64 = s.lastIndexOf(ch2, -2) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf(r'n', -7)=" + Int32(i1).toString() + "\n")
    print("lastIndexOf(r' ', -2)=" + Int32(i2).toString() + "\n")

    if (i1 == 1 && i2 == 7) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
