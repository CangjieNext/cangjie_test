// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: basic_operation.cj
// EXEC-0: %compiler %cmp_opt %n.cj basic_operation.cj %disableReflection --int-overflow=saturating -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f

/* SCAN
-128
-32768
-2147483648
-9223372036854775808
-9223372036854775808
0
0
0
0
0
*/

main() {
    let n: Int64 = 1 // sub
    let y: Int64 = 10
    println(foo<Int8>(-127, Int8(y), n))
    println(foo<Int16>(-32767, Int16(y), n))
    println(foo<Int32>(-2147483647, Int32(y), n))
    println(foo<Int64>(-9223372036854775807, Int64(y), n))
    println(Int64(foo<IntNative>(-9223372036854775807, IntNative(y), n)))
    println(foo<UInt8>(0, UInt8(y), n))
    println(foo<UInt16>(0, UInt16(y), n))
    println(foo<UInt32>(0, UInt32(y), n))
    println(foo<UInt64>(0, UInt64(y), n))
    println(UInt64(foo<UIntNative>(0, UIntNative(y), n)))
}
