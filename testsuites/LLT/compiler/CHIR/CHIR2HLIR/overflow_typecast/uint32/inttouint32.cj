// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 0
// ASSERT: scan b = 4294967291
// ASSERT: scan a1 = 0
// ASSERT: scan b1 = 4294965296
// ASSERT: scan a2 = 0
// ASSERT: scan b2 = 2147483648
// ASSERT: scan res = 100
// ASSERT: scan a3 = 4294967295
// ASSERT: scan b3 = 4294967295
// ASSERT: scan OverflowException: typecast

var MAX_INT16: Int16 = 0x7FFF
var MIN_INT32: Int32 = -0x8000_0000
var MAX_INT32: Int32 = 0x7FFF_FFFF
var max: Int64 = 0x7FFF_FFFF_FFFF_FFFF

func test_int8(y: Int8) {
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

func test_int16(y: Int16) {
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

func test_int32(y: Int32) {
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

func test_int64(y: Int64) {
    var a: UInt32 = 0
    @OverflowSaturating {
        => a = UInt32(y)
    }()
    print("a3 = " + a.toString() + "\n")
    var b: UInt32 = 0
    @OverflowWrapping {
        => b = UInt32(y)
    }()
    print("b3 = " + b.toString() + "\n")
}

main() {
    var v1: Int8 = -5
    test_int8(v1)
    var v2: Int16 = -2000
    test_int16(v2)
    var v3: Int32 = MIN_INT32
    test_int32(v3)
    var v4: UInt32 = 100
    var res: UInt32 = UInt32(v4)
    print("res = " + res.toString() + "\n")
    var v5: Int64 = 0x7FFF_FFFF_FFFF_FFFF
    test_int64(v5)
    var ret2: UInt32 = try {
        UInt32(max)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
