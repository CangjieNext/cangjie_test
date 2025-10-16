// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result: 579

internal import ffi_python.*

main() {
    Python.load()

    let code = "a = 123\n" +
               "b = 456\n" +
               "def myfoo():\n" +
               "    print(f'result: {a + b}')\n" +
               "myfoo()\n"
    Python.exec(code)

    Python.unload()
    0
}