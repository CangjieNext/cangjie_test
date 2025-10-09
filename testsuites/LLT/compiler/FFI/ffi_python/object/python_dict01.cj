// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a is 0
// ASSERT: scan b is 1
// ASSERT: scan c is 2
// ASSERT: scan WARN: Dict key "d" not found!
// ASSERT: scan b is 10
// ASSERT: scan d is 20
// ASSERT: scan a exist: true
// ASSERT: scan d exist: true
// ASSERT: scan e exist: false
// ASSERT: scan b.a is 0
// ASSERT: scan b.b is 1
// ASSERT: scan b.c is 2
// ASSERT: scan WARN: Dict key "d" not found!
// ASSERT: scan KeyError: ('e',)
// ASSERT: scan WARN: An error happend in dict del key "e".
// ASSERT: scan a size is 2
// ASSERT: scan b size is 3

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var a = PyDict<String, Int64>(HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]))

    var b = a.copy()

    // getItem
    print("a is ${a.getItem("a")}\n")
    print("b is ${a.getItem("b")}\n")
    print("c is ${a.getItem("c")}\n")
    a.getItem("d")

    // setItem
    a.setItem("b", 10)
    print("b is ${a.getItem("b")}\n")
    a.setItem("d", 20)
    print("d is ${a.getItem("d")}\n")

    // contains
    print("a exist: ${a.contains("a")}\n")
    print("d exist: ${a.contains("d")}\n")
    print("e exist: ${a.contains("e")}\n")

    // copy
    print("b.a is ${b.getItem("a")}\n")
    print("b.b is ${b.getItem("b")}\n")
    print("b.c is ${b.getItem("c")}\n")
    b.getItem("d")

    // del
    a.del("a")
    a.del("c")
    a.del("e")

    // size
    print("a size is ${a.size()}\n")
    print("b size is ${b.size()}\n")

    Python.unload()
}