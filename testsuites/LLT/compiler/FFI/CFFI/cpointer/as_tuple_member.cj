// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: basic.c
// EXEC: %clang %clang_shared_opt basic.c -o %cffi_output
// EXEC: %compiler -g %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1236\n4327\n4244

internal import std.process.*

foreign func getCPtrInt(num: UIntNative): CPointer<UIntNative>
foreign func free(ptr: CPointer<UIntNative>): Unit

enum E {
    E2((CPointer<UIntNative>, UIntNative))
}
var E2((x1, x2)) = E2((unsafe{ getCPtrInt(1234) }, 2))
let a: UIntNative = 2
let (x3, x4, x5, x6) = (unsafe{ getCPtrInt(4321) }, a, a, a)

func cleanMem(): Unit {
    unsafe { 
        free(x1)
        free(x3)
    }
}

unsafe main() {
    Process.current.atExit(cleanMem)

    let (x7, x8) = (unsafe{ getCPtrInt(4242) }, a)
    println(x1.read() + x2)
    println(x3.read() + x4 + x5 + x6 )
    println(x7.read() + x8)
    unsafe { free(x7) }
    0
}
