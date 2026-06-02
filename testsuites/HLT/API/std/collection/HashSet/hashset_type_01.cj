/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var str1: Array<Int8> = [5]
    var str2: Array<Int16> = [5]
    var r1: HashSet<Int8> = HashSet<Int8>(str1)
    var r2: HashSet<Int16> = HashSet<Int16>(str2)
    var r3: HashSet<Int32> = HashSet<Int32>()
    var r4: HashSet<Int64> = HashSet<Int64>([5])
    var r5: HashSet<UInt8> = HashSet<UInt8>([5])
    var r6: HashSet<UInt16> = HashSet<UInt16>([5])
    var r7: HashSet<UInt32> = HashSet<UInt32>(1)
    var r8: HashSet<UInt64> = HashSet<UInt64>(1, {x: Int64 => UInt64(x)})
    var r9: HashSet<Float16> = HashSet<Float16>([5.000000])
    var r10: HashSet<Float32> = HashSet<Float32>(1)
    var r11: HashSet<Float64> = HashSet<Float64>(1, {x: Int64 => Float64(x)})
    var m1: Int8 = 1
    var m2: Int16 = 1
    var m3: Int32 = 1
    var m4: Int64 = 1
    var m5: UInt8 = 1
    var m6: UInt16 = 1
    var m7: UInt32 = 1
    var m8: UInt64 = 1
    var m9: Float16 = 1.000000
    var m10: Float32 = 1.000000
    var m11: Float64 = 1.000000
    r1.add(m1)
    r2.add(m2)
    r3.add(m3)
    r4.add(m4)
    r5.add(m5)
    r6.add(m6)
    r7.add(m7)
    r8.add(m8)
    r9.add(m9)
    r10.add(m10)
    r11.add(m11)
    if (r1.size != 2 || r1.contains(m1) != true) {
        return 1
    }
    if (r2.size != 2 || r2.contains(m2) != true) {
        return 2
    }
    if (r3.size != 1 || r3.contains(m3) != true) {
        return 3
    }
    if (r4.size != 2 || r4.contains(m4) != true) {
        return 4
    }
    if (r5.size != 2 || r5.contains(m5) != true) {
        return 5
    }
    if (r6.size != 2 || r6.contains(m6) != true) {
        return 6
    }
    if (r7.size != 1 || r7.contains(m7) != true) {
        return 7
    }
    if (r8.size != 2 || r8.contains(m8) != true) {
        return 8
    }
    if (r9.size != 2 || r9.contains(m9) != true) {
        return 9
    }
    if (r10.size != 1 || r10.contains(m10) != true) {
        return 10
    }
    if (r11.size != 2 || r11.contains(m11) != true) {
        return 11
    }
    print("success1\n")
    return 0
}
