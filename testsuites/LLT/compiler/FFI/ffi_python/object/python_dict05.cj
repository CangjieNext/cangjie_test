// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a: size: 2
// ASSERT: scan (0, 1): 5, 0: 5, 
// ASSERT: scan TypeError: unhashable type: 'list'
// ASSERT: scan PythonException: Dict set item failed.
// ASSERT: scan TypeError: unhashable type: 'dict'
// ASSERT: scan PythonException: Dict set item failed.
// ASSERT: scan TypeError: unhashable type: 'set'
// ASSERT: scan PythonException: Dict set item failed.
// ASSERT: scan PyObj is unavailable.

internal import ffi_python.*
internal import std.collection.*

func printDict<K, V>(dict: PyDict<K, V>) where K <: Hashable & Equatable<K> & PyFFIType {
    print("size: ${dict.size()}\n")
    var map = dict.toCjObj()
    for((key, value) in map) {
        print("${key}: ${value}, ")
    }
    print("\n")
}

main() {
    Python.load(loglevel: LogLevel.WARN)

    // key is python tuple
    var a = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(Python.Eval("(0, 1)"), 5), (Python.Eval("0"), 5)]))
    print("a: ")
    printDict(a)

    // key is python list
    try {
        var b = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(Python.Eval("[0, 1]"), 5), (Python.Eval("0"), 5)]))
    } catch (e: PythonException) {println(e)}

    // key is python dict
    try {
        var c = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(Python.Eval("{0: 0, 1: 1}"), 5), (Python.Eval("0"), 5)]))
    } catch (e: PythonException) {println(e)}

    // key is python set
    try {
        var d = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(Python.Eval("{0, 1}"), 5), (Python.Eval("0"), 5)]))
    } catch (e: PythonException) {println(e)}

    try {
        //get a PyObj is not available
        var unavaileObj = PyLong(0) + PyString("")
        var e = PyDict<PyObj, Int64>(HashMap<PyObj, Int64>([(unavaileObj, 5), (Python.Eval("0"), 5)]))
    } catch (e: PythonException) {println(e)}

    Python.unload()
}