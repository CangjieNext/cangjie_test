// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not failure
// ASSERT: regex main

internal import std.core.sleep
internal import std.core.Duration
internal import ffi_python.*

foreign func gettid(): Int32

main() {
    
    let fut = spawn {
        Python.load("/usr/bin/python3")
        Python["print"](["failure"])
        Python.unload()
    }
    sleep(Duration.second * 1)
    Python.load()
    Python["print"](["main"])
    
    0
}
