// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Cangjie 33
// ASSERT: regex -1
// ASSERT: regex funcPtr is called!
// ASSERT: regex duration is
/* ASSERT: regex (null) */

@CallingConv[CDECL] // Can be omitted in default.
foreign func clock(): Int32

foreign func atexit(cb: CFunc<(CString)->Unit>, ...) : Int32
foreign func printf(fmt: CString, ...): Int32

foreign func `open`(pathname: CString, oflags: Int32): Int32

@C
func callableInCsss() : Unit {
    var tempCS: CString = unsafe {LibC.mallocCString("Cangjie %d\n")}
    unsafe {
        printf(tempCS, 33)
        LibC.free(tempCS)
    }
}

var funcPtr: CFunc<(CString) -> Unit> = { x : CString =>
    var str: CString = unsafe {LibC.mallocCString("%s\n")}
    unsafe { printf(str, x) }
    unsafe { LibC.free(str) }
}

main() {
    var tempCS: CString
    var start = unsafe { clock() }
    unsafe { callableInCsss() }
    var pathname = unsafe {LibC.mallocCString("./hello.txt")}
    var oflags = Int32(0)
    var handle = unsafe { `open`(pathname, oflags) }
    unsafe { LibC.free(pathname) }
    tempCS = unsafe { LibC.mallocCString("%d\n") }
    unsafe {
        printf(tempCS, handle)
        LibC.free(tempCS)
    }

    tempCS = unsafe {LibC.mallocCString("funcPtr is called!")}
    unsafe {
        funcPtr(tempCS)
        LibC.free(tempCS)
    }

    var stop = unsafe { clock() }
    var duration = stop - start
    tempCS = unsafe {LibC.mallocCString("duration is %d\n")}
    unsafe {
        printf(tempCS, duration)
        LibC.free(tempCS)
    }
    0
}
