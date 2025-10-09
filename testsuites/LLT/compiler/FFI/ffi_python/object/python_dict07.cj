// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan size after empty 0

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var a = PyDict<String, Int64>(HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]))

    a.empty()
    print("size after empty ${a.size()}\n")

    Python.unload()
}