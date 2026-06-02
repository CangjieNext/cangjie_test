// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

foreign func testfunc(): CPointer<Float32>
foreign func free(ptr: CPointer<Float32>): Unit

unsafe main():Int64 {
    var count = 0

    var ptr: CPointer<Float32> = testfunc()
    var backupPtr = ptr

    if ( (ptr.read(0) == 3.14) && (ptr.read(1) == 0.0) && (ptr.read(2) == -3.14) ){
        count += 1
    }

    ptr += 1

    if ( (ptr.read(-1) == 3.14) && (ptr.read() == 0.0) && ((ptr+1).read() == -3.14) ){
        count += 1
    }

    unsafe { free(backupPtr) }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
