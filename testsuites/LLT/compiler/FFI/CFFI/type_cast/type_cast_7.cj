// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output | compare %f
// ASSERT: scan Hello World\n


foreign {
    func ExecuteRandInC_3(ptr: CPointer<Int8>): Int32
    func printf(fmt: CString): Int32
}

unsafe main() {
    var f: CFunc<(CString) -> Int32> = printf
    var ptr = CPointer<Int8>(f)
    ExecuteRandInC_3(ptr)
    return 0
}
