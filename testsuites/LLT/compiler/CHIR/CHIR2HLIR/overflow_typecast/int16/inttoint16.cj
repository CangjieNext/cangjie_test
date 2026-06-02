// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 32767
// ASSERT: scan b = -1
// ASSERT: scan res = 5
// ASSERT: scan OverflowException: typecast

var MAX_INT32: Int32 = 0x7FFF_FFFF
var g_v3 = 65537 + 1

func test_int32(y: Int32) {
    var a: Int16 = 0
    @OverflowSaturating { // 此时采用饱和处理策略，不会抛异常。
        => a = Int16(y)
    }()
    print("a = " + a.toString() + "\n")
    var b: Int16 = 0
    @OverflowWrapping { // 此时采用截断处理策略，不会抛异常。
        => b = Int16(y)
    }()
    print("b = " + b.toString() + "\n")
}

main() {
    var v1: Int32 = MAX_INT32
    test_int32(v1)
    var v2: Int8 = 5
    var v3: Int64 = g_v3
    var res: Int16 = Int16(v2)
    print("res = " + res.toString() + "\n")
    var ret2: Int16 = try {
        Int16(v3)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
