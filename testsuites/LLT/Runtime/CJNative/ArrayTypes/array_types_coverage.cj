// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime array types pass

import std.collection.*
import std.runtime.*

// Test arrays with different element sizes to trigger type-specific allocation paths
func testInt8Array(): Bool {
    let arr = Array<Int8>(100, repeat: 42)
    arr[0] + arr[99] == 84
}

func testInt16Array(): Bool {
    let arr = Array<Int16>(100, repeat: 1000)
    arr[0] + arr[99] == 2000
}

func testUInt16Array(): Bool {
    let arr = Array<UInt16>(100, repeat: 500)
    arr[0] + arr[99] == 1000
}

func testInt32Array(): Bool {
    let arr = Array<Int32>(100, repeat: 10000)
    arr[0] + arr[99] == 20000
}

func testUInt32Array(): Bool {
    let arr = Array<UInt32>(100, repeat: 5000)
    arr[0] + arr[99] == 10000
}

func testFloat32Array(): Bool {
    let arr = Array<Float32>(100, repeat: 1.5)
    arr[0] + arr[99] == 3.0
}

func testLargeArray(): Bool {
    let arr = Array<Int64>(10000, {i => i})
    arr[0] == 0 && arr[9999] == 9999
}

func testNestedArrays(): Bool {
    let outer = Array<Array<Int64>>(10, {i => Array<Int64>(10, {j => Int64(i * 10 + j)})})
    outer[5][5] == 55
}

main(): Int64 {
    if (!testInt8Array()) { return 1 }
    if (!testInt16Array()) { return 2 }
    if (!testUInt16Array()) { return 3 }
    if (!testInt32Array()) { return 4 }
    if (!testUInt32Array()) { return 5 }
    if (!testFloat32Array()) { return 6 }
    if (!testLargeArray()) { return 7 }
    if (!testNestedArrays()) { return 8 }
    println("runtime array types pass")
    0
}
