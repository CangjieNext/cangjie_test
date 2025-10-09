// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1 success
// ASSERT: scan 2 success

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load(loglevel: LogLevel.WARN)

    // key is python tuple
    var a = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(Python.Eval("(0, 1)"), 5), (Python.Eval("0"), 5)]))
    var b = HashMap<PyObj, Int64>([(Python.Eval("(0, 1)"), 5), (Python.Eval("0"), 5)]).toPyObj()

    if (a.getItem(Python.Eval("(0, 1)")) == b.getItem(Python.Eval("(0, 1)"))) {
        print("1 success\n")
    }

    if (a.getItem(Python.Eval("0")) == b.getItem(Python.Eval("0"))) {
        print("2 success\n")
    }

    Python.unload()
}