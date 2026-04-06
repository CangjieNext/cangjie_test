/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// (not Windows) EXEC: %clang %clang_opt %n.c -o libc_ffi.%test_suffix
// (not Windows) EXEC: %compiler %cmp_opt c_ffi.cj -l dl -o %output

// (not Windows) RUN-EXEC: %run %run_opt %output %run_args

@When[os == "macOS"]
let LIB_NAME = "libc_ffi.dylib"
@When[os != "macOS"]
let LIB_NAME = "libc_ffi.so"

foreign {
    func dlopen(filename: CString, flags: Int32): CPointer<Int8>

    func dlsym(handle: CPointer<Int8>, symbol: CString): CPointer<Int8>

    func dlclose(handle: CPointer<Int8>): Int32
}

unsafe main(): Int64 {
    let RTLD_LAZY: Int32 = 1
    var handle = dlopen(unsafe { LibC.mallocCString(LIB_NAME) }, RTLD_LAZY)
    if (handle.isNull()) {
        return 1
    }
    var cfunc1 = dlsym(handle, unsafe { LibC.mallocCString("testfunc") })
    if (cfunc1.isNull()) {
        return 2
    }
    var cptr1 = CPointer<Float64>(cfunc1)
    if (cptr1.isNull()) {
        return 3
    }
    return 0
}
