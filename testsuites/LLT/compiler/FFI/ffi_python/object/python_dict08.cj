// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var a = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([]))
    try {a.getItem(Python.Eval("a = 1"))} catch(e: PythonException) {}

    var b = PyDict<Int64, PyObj>(HashMap<Int64, PyObj>([]))
    try {b.setItem(1, Python.Eval("a = 1"))} catch(e: PythonException) {}

    Python.unload()
}