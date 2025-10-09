// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan TypeError: 'NoneType' object is not subscriptable
// ASSERT: scan File "<string>", line 5, in <module>
// ASSERT: scan File "<string>", line 3, in p

internal import ffi_python.*

main() {
    Python.load()

    let code = "def p():\n" +
               "    x = None\n" +
               "    return x[0]\n" +
               "    print(f'result: {a + b}')\n" +
               "p()\n"
    try { Python.exec(code) } catch (e: PythonException) { println(e) }

    Python.unload()
    0
}