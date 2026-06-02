// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: basic_try_operation.cj
// EXEC-0: %compiler %cmp_opt %n.cj basic_try_operation.cj %disableReflection --int-overflow=throwing -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

main() {
    var res = 0
    let n: Int64 = 4 // mod
    let y: Int64 = -1
    res += foo<Int8>(-128, Int8(y), n)
    res += foo<Int16>(-32768, Int16(y), n)
    res += foo<Int32>(-2147483648, Int32(y), n)
    res += foo<Int64>(-9223372036854775808, Int64(y), n)
    res += foo<IntNative>(-9223372036854775808, IntNative(y), n)
    return res
}
