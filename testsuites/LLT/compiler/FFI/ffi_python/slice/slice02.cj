// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a: 12345, b: 12345, true
// ASSERT: scan a: , b: , true
// ASSERT: scan a: 123456, b: 123456, true
// ASSERT: scan a: , b: , true
// ASSERT: scan a: 1, b: 1, true
// ASSERT: scan a: , b: , true
// ASSERT: scan a: 65432, b: 65432, true

internal import ffi_python.*
internal import std.collection.*

func compare(range: Range<Int64>): Bool {
    var a = ""
    for (i in range) {
        a += i.toString()
    }

    var str = PyString("0123456")
    var b = str["__getitem__"]([range]).toString()
    print("a: ${a}, b: ${b}, ${a == b}\n")
    return a == b
}

main() {
    Python.load()
    compare(1..6:1)
    compare(1..6:-1)
    compare(1..=6:1)
    compare(1..=0:1)
    compare(1..=1:1)
    compare(6..1:1)
    compare(6..1:-1)

    0
}