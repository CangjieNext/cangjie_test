// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan TypeError: 'bool' object is not iterable
// ASSERT: scan TypeError: 'int' object is not iterable
// ASSERT: scan TypeError: 'float' object is not iterable
// ASSERT: scan S t r 
// ASSERT: scan T u p 
// ASSERT: scan L i s t
// ASSERT: scan 1 2 3 4 
// ASSERT: scan 1 2 3

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var B = PyBool(true)
    try { for (b in B) { } } catch(e: PythonException) {}

    var N = PyLong(1)
    try { for (n in N) { } } catch(e: PythonException) {}

    var F = PyFloat(1.1)
    try { for (f in F) { } } catch(e: PythonException) {}

    var S = PyString("Str")
    for (s in S) {
        print("${s} ")
    }
    print("\n")

    var T = PyTuple(["T".toPyObj(), "u".toPyObj(), "p".toPyObj()])
    for (t in T) {
        print("${t} ")
    }
    print("\n")

    var L = PyList(["L", "i", "s", "t"])
    for (l in L) {
        print("${l} ")
    }
    print("\n")

    var D = PyDict(HashMap<Int64, String>([(1, "D"), (2, "i"), (3, "c"), (4, "t")]))
    for (d in D) {
        print("${d} ")
    }
    print("\n")

    var Se = PySet(HashSet<Int64>([1, 2, 3]))
    for (s in Se) {
        print("${s} ")
    }
    print("\n")
    0
}