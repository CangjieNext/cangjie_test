// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: basic_operation.cj
// EXEC-0: %compiler %cmp_opt %n.cj basic_operation.cj %disableReflection --int-overflow=wrapping -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f

/* SCAN
-128
-32768
-2147483648
-9223372036854775808
-9223372036854775808
12
3276
214748364
922337203685477580
922337203685477580
25
6553
429496729
1844674407370955161
1844674407370955161
*/

main() {
    let n: Int64 = 3 // div
    var y: Int64 = -1
    println(foo<Int8>(-128, Int8(y), n))
    println(foo<Int16>(-32768, Int16(y), n))
    println(foo<Int32>(-2147483648, Int32(y), n))
    println(foo<Int64>(-9223372036854775808, Int64(y), n))
    println(Int64(foo<IntNative>(-9223372036854775808, IntNative(y), n)))

    y = 10
    println(foo<Int8>(127, Int8(y), n))
    println(foo<Int16>(32767, Int16(y), n))
    println(foo<Int32>(2147483647, Int32(y), n))
    println(foo<Int64>(9223372036854775807, Int64(y), n))
    println(Int64(foo<IntNative>(9223372036854775807, IntNative(y), n)))

    println(foo<UInt8>(255, UInt8(y), n))
    println(foo<UInt16>(65535, UInt16(y), n))
    println(foo<UInt32>(4294967295, UInt32(y), n))
    println(foo<UInt64>(18446744073709551615, UInt64(y), n))
    println(UInt64(foo<UIntNative>(18446744073709551615, UIntNative(y), n)))
}
