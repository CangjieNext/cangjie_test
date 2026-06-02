// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %core_cmp_opt   %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.time.*

// This function is only used in stdlib time.
foreign func CJ_TIME_GetEnvVariable(name: CString): CString

@When[os != "Windows"]
main(): Int64 {
    var name = unsafe { LibC.mallocCString("HOME") }
    var value = unsafe { CJ_TIME_GetEnvVariable(name) }
    unsafe { LibC.free(name) }
    if (value.isEmpty()) {
        return 1
    }
    if (value.size() <= 0) {
        return 2
    }
    let cStr = unsafe { LibC.mallocCString("/") }
    if (!value.startsWith(cStr)) {
        unsafe { LibC.free(cStr) }
        return 3
    }
    unsafe { LibC.free(cStr) }
    return 0
}

@When[os == "Windows"]
main(): Int64 {
    var name = unsafe { LibC.mallocCString("Path") }
    var value = unsafe { CJ_TIME_GetEnvVariable(name) }
    unsafe { LibC.free(name) }
    println(value)
    if (value.isEmpty()) {
        return 1
    }
    if (value.size() <= 0) {
        return 2
    }
    return 0
}
