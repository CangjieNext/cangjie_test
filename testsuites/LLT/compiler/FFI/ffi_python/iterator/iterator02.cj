// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan (1, 'D') (2, 'i') (3, 'c') (4, 't') 
// ASSERT: scan 1 2 3 4 
// ASSERT: scan D i c t 
// ASSERT: scan iterator() pass.


internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()

    var D = PyDict(HashMap<Int64, String>([(1, "D"), (2, "i"), (3, "c"), (4, "t")]))
    for (d in D.items()) {
        print("${d} ")
    }
    print("\n")
    for (d in D.keys()) {
        print("${d} ")
    }
    print("\n")
    for (d in D.values()) {
        print("${d} ")
    }
    print("\n")

    var iter = D.iterator()
    var s = ""
    for (d in iter) {
        s += d.toString()
    }
    if (s == "1234") {
        print("iterator() pass.\n")
    }
    0
}