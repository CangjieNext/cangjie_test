// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (CJNATIVE)EXEC: %compiler %f -o %output
// (CJNATIVE)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

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
    println(alignOf<Unit>())

    println(alignOf<UInt8>())
    println(alignOf<UInt16>())
    println(alignOf<UInt32>())
    println(alignOf<UInt64>())
    println(alignOf<Int8>())
    println(alignOf<Int16>())
    println(alignOf<Int32>())
    println(alignOf<Int64>())
    println(alignOf<Data>())

    println(alignOf<Float32>())
    println(alignOf<Float64>())

    println(alignOf<CString>())
    println(alignOf<CPointer<Int8>>())
    println(alignOf<CFunc<(CPointer<Int8>) -> Unit>>())
    return 0
}

/* SCAN
1
1
2
4
8
1
2
4
8
8
4
8
8
8
8
*/
