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

main(): Int64 {
    var a5: Array<UInt8> = [97, 8, 98, 99]
    var r5 = String.fromUtf8(a5[0..4]).iterator()
    var r6 = String.fromUtf8([32u8, 9u8, 10u8, 11u8, 12u8, 13u8][0..6]).iterator()
    print("|Test:")
    for (i in r5) {
        print("${i}")
    }
    print("|Test:")
    for (i in r6) {
        print("${i}")
    }
    print("\n")
    return 0
}
