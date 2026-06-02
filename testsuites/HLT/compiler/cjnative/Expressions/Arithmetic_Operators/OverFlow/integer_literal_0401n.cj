/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var lit01 = -0b1000000000_00000000000_0000000000000_00000000000000000000000000_0000_ - 0b1
    var lit02 = 0B11111111111111111111111111111111111111111111111111111111111111 + 1
    var lit03 = -9223_37_2_0368_5477_5808 - 1
    var lit04 = 1844674407370955163 + 1

    print("lit01: " + lit01.toString() + "\n")
    print("lit02: " + lit02.toString() + "\n")
    print("lit03: " + lit03.toString() + "\n")
    print("lit04: " + lit04.toString() + "\n")

    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
