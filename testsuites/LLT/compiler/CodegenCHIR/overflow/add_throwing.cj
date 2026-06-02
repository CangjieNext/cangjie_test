// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: basic_try_operation.cj
// EXEC-0: %compiler %cmp_opt %n.cj basic_try_operation.cj %disableReflection --int-overflow=throwing -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

main() {
    var res = -10
    let n: Int64 = 0 // add
    let y: Int64 = 10
    res += foo<Int8>(127, Int8(y), n)
    res += foo<Int16>(32767, Int16(y), n)
    res += foo<Int32>(2147483647, Int32(y), n)
    res += foo<Int64>(9223372036854775807, Int64(y), n)
    res += foo<IntNative>(9223372036854775807, IntNative(y), n)
    res += foo<UInt8>(255, UInt8(y), n)
    res += foo<UInt16>(65535, UInt16(y), n)
    res += foo<UInt32>(4294967295, UInt32(y), n)
    res += foo<UInt64>(18446744073709551615, UInt64(y), n)
    res += foo<UIntNative>(18446744073709551615, UIntNative(y), n)
    return res
}
