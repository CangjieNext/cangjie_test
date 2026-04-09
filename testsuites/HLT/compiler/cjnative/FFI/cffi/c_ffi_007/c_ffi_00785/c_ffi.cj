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

foreign func free(cp: CPointer<Int8>): Unit

unsafe main(): Int64 {
    let RTLD_LAZY: Int32 = 1
    var cStr1 = unsafe { LibC.mallocCString(LIB_NAME) }
    var cStr2 = unsafe { LibC.mallocCString("getCPointer") }
    var handle = dlopen(cStr1, RTLD_LAZY)
    if (handle.isNull()) {
        return 1
    }
    var ptr = dlsym(handle, cStr2)
    if (ptr.isNull()) {
        return 2
    }
    var foo = CFunc<() -> CPointer<UInt32>>(ptr)
    var res = foo()
    var b = res.read(0) == 0 && res.read(1) == 2 && res.read(2) == 4294967295

    free(CPointer<Int8>(res))
    LibC.free(cStr1)
    LibC.free(cStr2)
    dlclose(handle)

    if (b) {
        return 0
    } else {
        return 3
    }
}
