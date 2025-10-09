// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success01
// ASSERT: scan success11
// ASSERT: scan success21
// ASSERT: scan success02
// ASSERT: scan success12
// ASSERT: scan success22

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load(loglevel: LogLevel.INFO)
    
    if (1.toPyObj() == Python.Eval("1")) {
        print("success01\n")
    }

    if (true.toPyObj() == Python.Eval("True")) {
        print("success11\n")
    }

    if ('a'.toPyObj() == Python.Eval("'a'")) {
        print("success21\n")
    }

    if (!(1.toPyObj() != Python.Eval("1"))) {
        print("success02\n")
    }

    if (!(true.toPyObj() != Python.Eval("True"))) {
        print("success12\n")
    }

    if (!('a'.toPyObj() != Python.Eval("'a'"))) {
        print("success22\n")
    }

    try {1.toPyObj() == Python.Eval("a = 1")}catch(e: PythonException) {}

    try {Python.Eval("a = 1") == 1.toPyObj()}catch(e: PythonException) {}

    try {1.toPyObj() != Python.Eval("a = 1")}catch(e: PythonException) {}

    try {Python.Eval("a = 1") != 1.toPyObj()}catch(e: PythonException) {}

    Python.unload()
}