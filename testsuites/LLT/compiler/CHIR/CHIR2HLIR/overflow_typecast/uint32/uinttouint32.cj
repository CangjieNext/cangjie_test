// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 100
// ASSERT: scan b = 100
// ASSERT: scan a1 = 65535
// ASSERT: scan b1 = 65535
// ASSERT: scan a2 = 4294967295
// ASSERT: scan b2 = 4294967295
// ASSERT: scan OverflowException: typecast

var MAX_UINT16: UInt16 = 0xFFFF
var MAX_UINT32: UInt32 = 0xFFFF_FFFF
var max: UInt64 = 0xFFFF_FFFF_FFFF_FFFF

func test_uint8(y: UInt8) {
    var a: UInt32 = 0
    @OverflowSaturating { // 此时采用饱和处理策略，不会抛异常。
        => a = UInt32(y)
    }()
    print("a = " + a.toString() + "\n")
    var b: UInt32 = 0
    @OverflowWrapping { // 此时采用截断处理策略，不会抛异常。
        => b = UInt32(y)
    }()
    print("b = " + b.toString() + "\n")
}

func test_uint16(y: UInt16) {
    var a: UInt32 = 0
    @OverflowSaturating {
        => a = UInt32(y)
    }()
    print("a1 = " + a.toString() + "\n")
    var b: UInt32 = 0
    @OverflowWrapping {
        => b = UInt32(y)
    }()
    print("b1 = " + b.toString() + "\n")
}

func test_uint32(y: UInt32) {
    var a: UInt32 = 0
    @OverflowSaturating {
        => a = UInt32(y)
    }()
    print("a2 = " + a.toString() + "\n")
    var b: UInt32 = 0
    @OverflowWrapping {
        => b = UInt32(y)
    }()
    print("b2 = " + b.toString() + "\n")
}

main() {
    var v1: UInt8 = 100
    test_uint8(v1)
    var v2: UInt16 = MAX_UINT16
    test_uint16(v2)
    var v3: UInt32 = MAX_UINT32
    test_uint32(v3)
    var ret2: UInt32 = try {
        UInt32(max)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
