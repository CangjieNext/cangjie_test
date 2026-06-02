// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

@C
struct Data {
    var a: UInt8 = 0
    var b: UInt16 = 0
    var c: UInt32 = 0
    var d: UInt64 = 0
    var e: Int8 = 0
    var f: Int16 = 0
    var g: Int32 = 0
    var h: Int64 = 0
}

main() {
    println(sizeOf<Unit>())

    println(sizeOf<UInt8>())
    println(sizeOf<UInt16>())
    println(sizeOf<UInt32>())
    println(sizeOf<UInt64>())
    println(sizeOf<Int8>())
    println(sizeOf<Int16>())
    println(sizeOf<Int32>())
    println(sizeOf<Int64>())
    println(sizeOf<Data>())

    println(sizeOf<Float32>())
    println(sizeOf<Float64>())

    println(sizeOf<CString>())
    println(sizeOf<CPointer<Int8>>())
    println(sizeOf<CFunc<(CPointer<Int8>) -> Unit>>())
    return 0
}

/* SCAN
0
1
2
4
8
1
2
4
8
32
4
8
8
8
8
*/
