// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 127
// ASSERT: scan b = -126
// ASSERT: scan res = 5
// ASSERT: scan OverflowException: typecast

var g_v3: UInt64 = 500

func test_uint16(y: UInt16) {
    var a: Int8 = 0
    @OverflowSaturating { // 此时采用饱和处理策略，不会抛异常。
        => a = Int8(y)
    }()
    print("a = " + a.toString() + "\n")
    var b: Int8 = 0
    @OverflowWrapping { // 此时采用截断处理策略，不会抛异常。
        => b = Int8(y)
    }()
    print("b = " + b.toString() + "\n")
}

main() {
    var v1: UInt16 = 130
    test_uint16(v1)
    var v2: Int32 = 5
    var v3: UInt64 = g_v3
    var res: Int8 = Int8(v2)
    print("res = " + res.toString() + "\n")
    var ret2: Int8 = try {
        Int8(v3)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
