// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: basic.c
// EXEC: %clang %clang_shared_opt basic.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 11142\n

foreign func getCPtrInt(num: UIntNative): CPointer<UIntNative>
foreign func free(ptr: CPointer<UIntNative>): Unit

interface ToStringI {
    func toString(): String
}

extend<T> CPointer<T> <: ToStringI where T <: ToString {
    public func toString(): String {
        return unsafe{this.read().toString()}
    }
}

unsafe main() {
    var ptr = getCPtrInt(11142)
    println("${ptr.toString()}")
    unsafe { free(ptr) }
    0
}
