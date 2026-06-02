// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %cffi-link %f -o %output
// RUN-EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World
// ASSERT: scan PASS1
// ASSERT: scan PASS2


foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString
foreign func fflushOut(): Unit

main():Int64 {
    var input: CString = unsafe {LibC.mallocCString("Hello")}
    var str: CString
    unsafe { str = testfunc(input) }
    unsafe { printf(str) }
    unsafe { fflushOut() }
    if (!str.isEmpty()) {
        print("PASS1\n")
    } else {
        print("ERROR\n")
    }
    unsafe { LibC.free(input) }
    unsafe { LibC.free(str) }
    input = CString(CPointer<UInt8>())
    if (input.isNull()) {
        print("PASS2\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
