// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 246
// ASSERT: scan 246
// ASSERT: scan ['b', 'd', 'f']
// ASSERT: scan ['b', 'd', 'f']
// ASSERT: scan ('j', 'l', 'n')
// ASSERT: scan ('j', 'l', 'n')

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var range = 1..6:2
    var slice = PySlice(range)

    var str = PyString("1234567")
    println(str["__getitem__"]([range]))
    println(str["__getitem__"]([slice]))

    var list = PyList(["a", "b", "c", "d", "e", "f", "g", "h"])
    println(list["__getitem__"]([range]))
    println(list["__getitem__"]([slice]))

    var tup = PyTuple(["i".toPyObj(), "j".toPyObj(), "k".toPyObj(), "l".toPyObj(), "m".toPyObj(), "n".toPyObj(), "o".toPyObj(), "p".toPyObj()])
    println(tup["__getitem__"]([range]))
    println(tup["__getitem__"]([slice]))
    0
}