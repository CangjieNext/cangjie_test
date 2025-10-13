// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: fuzz.c
// EXEC: %clang %clang_shared_opt fuzz.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan testParse1 str
// ASSERT: scan testParse1 print end
// ASSERT: scan from testParse1
// ASSERT: scan 5print CString


internal import std.time.*
internal import std.collection.*

@C
func testParse(date : CString, ptn : CString) : Unit {

    if (!date.isEmpty()) {
        print("1\n")
        print(date.size().toString())
    }
    if (!ptn.isEmpty()) {
        print("2\n")
        print(ptn.size().toString())
    }

    print("print CString\n")
    let a : CString = unsafe{LibC.mallocCString("hello")}
    unsafe {
        printf(a)
    }
    unsafe {
        printf(ptn)
    }
    print("print end\n")
    unsafe {
        LibC.free(a)
    }
}

let testParse1:CFunc<(CString, CString) -> Unit> = {date : CString, ptn : CString =>

    if (!date.isEmpty()) {
        print("from testParse1\n")
        print(date.size().toString())
    }
    if (!ptn.isEmpty()) {
        print("2\n")
        print(ptn.size().toString())
    }

    print("print CString\n")
    let a : CString = unsafe {LibC.mallocCString("testParse1 str")}
    unsafe {
        printf(a)
    }
    unsafe {
        printf(ptn)
    }
    print("testParse1 print end\n")
    unsafe {
        LibC.free(a)
    }
}

foreign func fuzz(cb: CFunc<(CString, CString)->Unit>) : Int32
foreign func printf(fmt: CString, ...): Int32

main() : Int64 {
    var a = unsafe {LibC.mallocCString("abcd")}
    var b = unsafe {LibC.mallocCString("efgh")}
    unsafe { testParse(a, b)}
    unsafe { testParse1(a, b)}
    unsafe { fuzz(testParse1)}
    unsafe {
        LibC.free(a)
        LibC.free(b)
        return Int64(fuzz(testParse))
    }
}
