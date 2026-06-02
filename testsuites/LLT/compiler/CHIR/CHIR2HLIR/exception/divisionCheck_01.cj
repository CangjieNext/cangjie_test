// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan Int8Div:11 -5 -11 -5 -11 5 11 5
// ASSERT: scan Int16Div:181 -5 -181 -5 -181 5 181 5
// ASSERT: scan Int32Div:46341 -41700 -46341 -41700 -46341 41700 46341 41700
// ASSERT: scan Int64Div:3037000500 -2891526300 -3037000500 -2891526300 -3037000500 2891526300 3037000500 2891526300
// ASSERT: scan UInt8Div:15 0
// ASSERT: scan UInt16Div:255 255
// ASSERT: scan UInt32Div:20724 12553
// ASSERT: scan UInt64Div:1358187913 351659592
// ASSERT: scan UInt64Div:1358187913 351659592
// ASSERT: scan UInt32Div:20724 12553
// ASSERT: scan UInt16Div:255 255
// ASSERT: scan UInt8Div:15 0
// ASSERT: scan Int64Div:3037000500 -2891526300 -3037000500 -2891526300 -3037000500 2891526300 3037000500 2891526300
// ASSERT: scan Int32Div:46341 -41700 -46341 -41700 -46341 41700 46341 41700
// ASSERT: scan Int16Div:181 -5 -181 -5 -181 5 181 5
// ASSERT: scan Int8Div:11 -5 -11 -5 -11 5 11 5

func Int8Div() {
    var a0: Int8 = -126
    var a1: Int8 = 126
    var b0: Int8 = -11
    var b1: Int8 = 11

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    print(
        "Int8Div:" + c0.toString() + " " + c1.toString() + " " + c2.toString() + " " + c3.toString() + " " +
            c4.toString() + " " + c5.toString() + " " + c6.toString() + " " + c7.toString() + "\n")
}

func Int16Div() {
    var a0: Int16 = -32766
    var a1: Int16 = 32766
    var b0: Int16 = -181
    var b1: Int16 = 181

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    print(
        "Int16Div:" + c0.toString() + " " + c1.toString() + " " + c2.toString() + " " + c3.toString() + " " +
            c4.toString() + " " + c5.toString() + " " + c6.toString() + " " + c7.toString() + "\n")
}

func Int32Div() {
    var a0: Int32 = -2147483640
    var a1: Int32 = 2147483640
    var b0: Int32 = -46340
    var b1: Int32 = 46340

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    print(
        "Int32Div:" + c0.toString() + " " + c1.toString() + " " + c2.toString() + " " + c3.toString() + " " +
            c4.toString() + " " + c5.toString() + " " + c6.toString() + " " + c7.toString() + "\n")
}

func Int64Div() {
    var a0: Int64 = -9223372036854775800
    var a1: Int64 = 9223372036854775800
    var b0: Int64 = -3037000499
    var b1: Int64 = 3037000499

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    print(
        "Int64Div:" + c0.toString() + " " + c1.toString() + " " + c2.toString() + " " + c3.toString() + " " +
            c4.toString() + " " + c5.toString() + " " + c6.toString() + " " + c7.toString() + "\n")
}

func UInt8Div() {
    var a0: UInt8 = 225
    var b0: UInt8 = 15

    var c0 = a0 / b0
    var c1 = a0 % b0

    print("UInt8Div:" + c0.toString() + " " + c1.toString() + "\n")
}

func UInt16Div() {
    var a0: UInt16 = 65535
    var b0: UInt16 = 256

    var c0 = a0 / b0
    var c1 = a0 % b0

    print("UInt16Div:" + c0.toString() + " " + c1.toString() + "\n")
}

func UInt32Div() {
    var a0: UInt32 = 429496729
    var b0: UInt32 = 20724

    var c0 = a0 / b0
    var c1 = a0 % b0

    print("UInt32Div:" + c0.toString() + " " + c1.toString() + "\n")
}

func UInt64Div() {
    var a0: UInt64 = 1844674407370955161
    var b0: UInt64 = 1358187913

    var c0 = a0 / b0
    var c1 = a0 % b0

    print("UInt64Div:" + c0.toString() + " " + c1.toString() + "\n")
}

main(): Int64 {
    Int8Div()
    Int16Div()
    Int32Div()
    Int64Div()
    UInt8Div()
    UInt16Div()
    UInt32Div()
    UInt64Div()
    UInt64Div()
    UInt32Div()
    UInt16Div()
    UInt8Div()
    Int64Div()
    Int32Div()
    Int16Div()
    Int8Div()
    return 0
}
