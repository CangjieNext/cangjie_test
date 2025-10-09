// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan true
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10
// ASSERT: scan 10.2
// ASSERT: scan 10.2
// ASSERT: scan cangjie data
// ASSERT: scan 1: true
// ASSERT: scan 2: true
// ASSERT: scan 21: true
// ASSERT: scan 22: true
// ASSERT: scan 3: true
// ASSERT: scan 4: true
// ASSERT: scan 41: true
// ASSERT: scan 42: true
// ASSERT: scan 5: true
// ASSERT: scan 6: true
// ASSERT: scan 7: true
// ASSERT: scan 8: true
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var p1 = PyBool(true)
    var p2 = PyLong(Int8(10))
    var p21 = PyLong(Int16(10))
    var p22 = PyLong(Int32(10))
    var p3 = PyLong(Int64(10))
    var p4 = PyLong(UInt8(10))
    var p41 = PyLong(UInt16(10))
    var p42 = PyLong(UInt32(10))
    var p5 = PyLong(UInt64(10))
    var p6 = PyFloat(Float32(10.2))
    var p7 = PyFloat(Float64(10.2))
    var p8 = PyString("cangjie data")

    print("${p1}\n")
    print("${p2}\n")
    print("${p21}\n")
    print("${p22}\n")
    print("${p3}\n")
    print("${p4}\n")
    print("${p41}\n")
    print("${p42}\n")
    print("${p5}\n")
    print("${p6}\n")
    print("${p7}\n")
    print("${p8}\n")

    var c1: Bool = p1.toCjObj()
    var c2: Int64 = p2.toCjObj()
    var c21: Int64 = p21.toCjObj()
    var c22: Int64 = p22.toCjObj()
    var c3: Int64 = p3.toCjObj()
    var c4: Int64 = p4.toCjObj()
    var c41: Int64 = p41.toCjObj()
    var c42: Int64 = p42.toCjObj()
    var c5: Int64 = p5.toCjObj()
    var c6: Float64 = p6.toCjObj()
    var c7: Float64 = p7.toCjObj()
    var c8: String = p8.toCjObj()

    print("1: ${c1 == true}\n")
    print("2: ${c2 == 10}\n")
    print("21: ${c21 == 10}\n")
    print("22: ${c22 == 10}\n")
    print("3: ${c3 == 10}\n")
    print("4: ${c4 == 10}\n")
    print("41: ${c41 == 10}\n")
    print("42: ${c42 == 10}\n")
    print("5: ${c5 == 10}\n")
    print("6: ${Float32(c6) == 10.2}\n")
    print("7: ${c7 == 10.2}\n")
    print("8: ${c8 == "cangjie data"}\n")

    Python.unload()
    return 0
}
