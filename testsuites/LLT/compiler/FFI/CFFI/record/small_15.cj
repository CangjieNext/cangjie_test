// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-3 10}
// ASSERT: scan 136

foreign func free(ptr: CPointer<UInt8>): Unit

@C
struct ArrayU8 {
    var ptr: CPointer<UInt8>
    var size: UInt64

    init(ptr: CPointer<UInt8>, size: UInt64) {
        this.ptr = ptr
        this.size = size
    }
}

foreign {
    func GetCPtr(): CPointer<UInt8>
    func UseCArray(au0: ArrayU8, au1: ArrayU8, flag: Bool, au2: ArrayU8): UInt64
}

unsafe main() {
    var ptr = GetCPtr()
    println(ptr.toUIntNative())
    var au = ArrayU8(ptr, 10)
    var sum = UseCArray(au, au, true, au)
    println(sum)
    unsafe { free(ptr) }
    0
}
