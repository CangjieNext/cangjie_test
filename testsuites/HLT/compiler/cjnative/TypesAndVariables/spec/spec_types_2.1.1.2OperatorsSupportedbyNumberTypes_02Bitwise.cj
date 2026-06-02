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
    if ((!10) == -11) {
        print("bitwise logical NOT operator: -11 ")
    }
    if ((10 << 1) == 20) {
        print("left shift operator: 10*2=20 ")
    }
    if ((10 >> 1) == 5) {
        print("left shift operator: 10/2=5 ")
    }
    if ((10 & 15) == 10) {
        print("bitwise logical AND operator: 10 ")
    }
    if ((10 ^ 15) == 5) {
        print("mod result: 1 ")
    }
    if ((10 | 15) == 15) {
        print("bitwise logical OR operator: 15 ")
    }
    if ((0b1010 & 0b1110 ^ 0b1111 | 0b0101) == 0b0101) {
        print("result: 0b0101")
    }
    return 0
}
