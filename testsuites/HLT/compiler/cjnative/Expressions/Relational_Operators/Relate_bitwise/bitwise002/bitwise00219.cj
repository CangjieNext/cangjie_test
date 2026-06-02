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
    var a: Int32 = 1
    var b: Int32 = 0
    var c: Int32 = 2147483647
    var d: Int32 = 0
    b = a << 127
    if (b != c) {
        return 1
    }
    d = c >> 127
    if (d != a) {
        return 1
    }
    return 0
}
// ASSERT: scan chir_shift_length_overflow
