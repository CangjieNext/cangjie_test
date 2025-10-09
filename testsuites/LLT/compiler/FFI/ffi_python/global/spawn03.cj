// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex ---main---
// ASSERT: regex ---fut---

internal import ffi_python.*

main() {
    Python.load()
    let fut = spawn {
        Python.load()
        Python["print"](["---fut---"])
    }
    Python["print"](["---main---"])

    fut.get()
    0
}
