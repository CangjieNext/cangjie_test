// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: basic.c
// EXEC: %clang %clang_shared_opt basic.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 112342

foreign func getCPtrInt(num: UIntNative): CPointer<UIntNative>
foreign func free(ptr: CPointer<UIntNative>): Unit

enum E {
    E2(CPointer<UIntNative>) | M(UIntNative)
}

unsafe main() {
    var a = getCPtrInt(112342)
    var e = E2(a)
    match (e) {
        case E2(x1) => println(x1.read())
        case _ => println(0)
    }
    unsafe { free(a) }
    0
}
