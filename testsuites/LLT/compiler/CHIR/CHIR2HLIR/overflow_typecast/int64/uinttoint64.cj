// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 5
// ASSERT: scan b = 5
// ASSERT: scan a1 = 65535
// ASSERT: scan b1 = 65535
// ASSERT: scan a2 = 2147483647
// ASSERT: scan b2 = -1
// ASSERT: scan res = 100
// ASSERT: scan OverflowException: typecast

var MAX_UINT16: UInt16 = 0xFFFF
var MAX_UINT32: UInt32 = 0xFFFF_FFFF
var test: UInt64 = 0xFFFF_FFFF_FFFF_FFFF

func test_int8(y: UInt8) {
    var a: Int64 = 0
    @OverflowSaturating { // 此时采用饱和处理策略，不会抛异常。
        => a = Int64(y)
    }()
    print("a = " + a.toString() + "\n")
    var b: Int32 = 0
    @OverflowWrapping { // 此时采用截断处理策略，不会抛异常。
        => b = Int32(y)
    }()
    print("b = " + b.toString() + "\n")
}

func test_int16(y: UInt16) {
    var a: Int32 = 0
    @OverflowSaturating {
        => a = Int32(y)
    }()
    print("a1 = " + a.toString() + "\n")
    var b: Int32 = 0
    @OverflowWrapping {
        => b = Int32(y)
    }()
    print("b1 = " + b.toString() + "\n")
}

func test_int32(y: UInt32) {
    var a: Int32 = 0
    @OverflowSaturating {
        => a = Int32(y)
    }()
    print("a2 = " + a.toString() + "\n")
    var b: Int32 = 0
    @OverflowWrapping {
        => b = Int32(y)
    }()
    print("b2 = " + b.toString() + "\n")
}

main() {
    var v1: UInt8 = 5
    test_int8(v1)
    var v2: UInt16 = MAX_UINT16
    test_int16(v2)
    var v3: UInt32 = MAX_UINT32
    test_int32(v3)
    var v4: Int64 = 100
    var res: Int64 = Int64(v4)
    print("res = " + res.toString() + "\n")
    var ret2: Int64 = try {
        Int64(test)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
