/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func forinrange<T>(start: T, end: T, step: Int64) where T <: Countable<T> & Comparable<T> & Equatable<T> & ToString {
    var count = 0
    for (_ in start..end : step) {
        count++
    }
    if (count != 1) {
        throw Exception("unexpected result in start = ${start}")
    }
}

main() {
    forinrange<Int8>(0, 127, 127)
    forinrange<UInt8>(0, 255, 255)
    forinrange<Int64>(0, 9223372036854775807, 9223372036854775807)
    forinrange<Int64>(-1, 9223372036854775806, 9223372036854775807)
    forinrange<Int64>(0, -9223372036854775808, -9223372036854775808)
    forinrange<UInt64>(9223372036854775808, 18446744073709551615, 9223372036854775807)
}
