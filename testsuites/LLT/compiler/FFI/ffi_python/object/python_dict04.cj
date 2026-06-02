// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 5
// ASSERT: scan 6
// ASSERT: scan WARN: Dict key "2" not found!
// ASSERT: scan false
// ASSERT: scan 5

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
    var hashmap = HashMap<PyObj, Int64>([(1.toPyObj(), 3), (2.toPyObj(), 4), (Python.Eval("1"), 5), ("1".toPyObj(), 6)])
    var a = PyDict<PyObj, Int64>(hashmap)
    
    println(a.getItem(1.toPyObj()))

    println(a.getItem("1".toPyObj()))

    println(a.getItem("2".toPyObj()).isAvailable())

    println(a.getItem(Python.Eval("1")))

    Python.unload()
}