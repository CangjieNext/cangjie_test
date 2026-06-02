// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output

foreign {
    func ExecuteRandInC_1(f: CFunc<() -> Int32>): Int32
    func rand(): Int32
}

unsafe main() {
    var ptr = CPointer<Int8>(rand)
    var f = CFunc<() -> Int32>(ptr)
    ExecuteRandInC_1(f)
    0
}
