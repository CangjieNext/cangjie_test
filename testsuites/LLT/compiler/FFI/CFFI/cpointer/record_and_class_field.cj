// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: basic.c
// EXEC: %clang %clang_shared_opt basic.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 11142\n22242\n33342\n44442

foreign func getCPtrInt(num: UIntNative): CPointer<UIntNative>
foreign func free(ptr: CPointer<UIntNative>): Unit

struct A {
    var a0: CPointer<UIntNative> = CPointer<UIntNative>()
    var a1: CPointer<UIntNative> = CPointer<UIntNative>()
}

class AC {
    var a0: CPointer<UIntNative> = CPointer<UIntNative>()
    var a1: CPointer<UIntNative> = CPointer<UIntNative>()
}

unsafe main() {
    var ptr0 = getCPtrInt(11142)
    var ptr1 = getCPtrInt(22242)
    var a = A()
    a.a0 = ptr0
    a.a1 = ptr1
    println("${a.a0.read()}")
    println("${a.a1.read()}")
    unsafe {
        free(ptr0)
        free(ptr1)
    }

    ptr0 = getCPtrInt(33342)
    ptr1 = getCPtrInt(44442)
    var ac = AC()
    ac.a0 = ptr0
    ac.a1 = ptr1
    println("${ac.a0.read()}")
    println("${ac.a1.read()}")
    unsafe {
        free(ptr0)
        free(ptr1)
    }
    0
}
