// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\nPASS\n


foreign func testfunc(fmt: CString): Int32

main():Int64 {
    unsafe { 
        let strPointer = LibC.mallocCString("Hello World\n")
        if (testfunc(strPointer) == 12) {
            print("PASS\n")
        } 
        else {
            print("ERROR\n")
        }
        LibC.free(strPointer)
    }
    return 0
}
