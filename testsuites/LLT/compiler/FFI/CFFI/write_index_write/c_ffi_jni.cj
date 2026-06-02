// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before:
// ASSERT: scan after:


foreign func testfunc(): CPointer<Int8>
foreign func free(ptr: CPointer<Int8>): Unit

unsafe main():Int64 {
    var ptr: CPointer<Int8> = testfunc()
    var ptrtmp: CPointer<Int8> = ptr + 1

    print("before: ")

    (ptrtmp - 1).write(1, Int8(UInt32(r'd')))

    print("\n")
    print("after: ")
    unsafe { free(ptr) }
    return 0
}
