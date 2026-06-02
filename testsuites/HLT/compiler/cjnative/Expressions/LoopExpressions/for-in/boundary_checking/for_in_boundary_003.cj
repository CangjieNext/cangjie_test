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

func forinrange<T>(start: T) where T <: Countable<T> & Comparable<T> & Equatable<T> & ToString {
    var count = 0
    for (_ in start..=start) {
        count++
    }
    if (count != 1) {
        throw Exception("unexpected result in start = ${start}")
    }
}

main() {
    forinrange<Int8>(-128)
    forinrange<Int8>(127)
    forinrange<UInt8>(0)
    forinrange<UInt8>(255)
    forinrange<Int16>(32767)
    forinrange<Int16>(-32768)
    forinrange<UInt16>(65535)
    forinrange<UInt16>(-0)
    forinrange<Int32>(2147483647)
    forinrange<Int32>(-2147483648)
    forinrange<UInt32>(4294967295)
    forinrange<UInt32>(0)
    forinrange<UInt64>(18446744073709551615)
    forinrange<UInt64>(0)
}
