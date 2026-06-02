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
    var s: String = "indexOf Test fff"
    var ch1: Byte = UInt8(UInt32(r'f'))
    var i1: Int64 = s.indexOf(ch1, -9223372036854775807) ?? -1

    print("s = " + s + "\n")
    print("indexOf(r'f', -9223372036854775807)=" + Int32(i1).toString() + "\n")

    if (i1 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
