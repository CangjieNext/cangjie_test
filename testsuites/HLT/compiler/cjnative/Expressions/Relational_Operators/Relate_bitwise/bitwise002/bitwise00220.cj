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
    var a: Int8 = 1
    var b: Int8 = 0
    var c: Int8 = 127
    var d: Int8 = 0
    b = a << 126
    if (b != c) {
        return 1
    }
    d = c >> 126
    if (d != a) {
        return 1
    }
    return 0
}

// ASSERT: scan chir_shift_length_overflow
