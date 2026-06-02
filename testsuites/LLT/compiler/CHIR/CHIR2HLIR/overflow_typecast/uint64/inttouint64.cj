// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan a = 2147483647
// ASSERT: scan b = 2147483647
// ASSERT: scan res = 100
// ASSERT: scan OverflowException: typecast

var MAX_INT16: Int16 = 0x7FFF
var MIN_INT32: Int32 = -0x8000_0000
var MAX_INT32: Int32 = 0x7FFF_FFFF
var max: Int64 = -0x8000_0000_0000_0000

func test_int32(y: Int32) {
    var a: UInt64 = 0
    @OverflowSaturating {
        => a = UInt64(y)
    }()
    print("a = " + a.toString() + "\n")
    var b: UInt64 = 0
    @OverflowWrapping {
        => b = UInt64(y)
    }()
    print("b = " + b.toString() + "\n")
}

main() {
    var v3: Int32 = MAX_INT32
    test_int32(v3)
    var v4: UInt64 = 100
    var res: UInt64 = UInt64(v4)
    print("res = " + res.toString() + "\n")
    var ret2: UInt64 = try {
        UInt64(max)
    } catch (e: Exception) {
        print("OverflowException: typecast")
        0
    } finally {}
    return 0
}
